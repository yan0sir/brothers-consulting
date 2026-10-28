using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;

public struct P { public double X, Y; public P(double x, double y) { X = x; Y = y; } }

public class Seg { public P A, C1, C2, B; }

public class Loop { public List<Seg> Segs = new List<Seg>(); public double MinX, MinY, MaxX, MaxY, Area; }

public static class Tracer
{
    static CultureInfo IC = CultureInfo.InvariantCulture;

    public static float[,] Coverage(string path, out int w, out int h)
    {
        using (var b = new Bitmap(path))
        {
            w = b.Width; h = b.Height;
            var c = new float[w, h];
            for (int x = 0; x < w; x++) for (int y = 0; y < h; y++) c[x, y] = b.GetPixel(x, y).A / 255f;
            return c;
        }
    }

    static double CR(double t, double a, double b, double c, double d)
    {
        return 0.5 * ((2 * b) + (-a + c) * t + (2 * a - 5 * b + 4 * c - d) * t * t + (-a + 3 * b - 3 * c + d) * t * t * t);
    }

    static float Get(float[,] c, int x, int y, int w, int h)
    {
        if (x < 0 || y < 0 || x >= w || y >= h) return 0f;
        return c[x, y];
    }

    // Bicubic sample at continuous pixel-space coordinate (pixel i spans [i, i+1]).
    static double Sample(float[,] c, int w, int h, double xo, double yo)
    {
        double tx = xo - 0.5, ty = yo - 0.5;
        int ix = (int)Math.Floor(tx), iy = (int)Math.Floor(ty);
        double fx = tx - ix, fy = ty - iy;
        double[] col = new double[4];
        for (int k = -1; k <= 2; k++)
            col[k + 1] = CR(fx, Get(c, ix - 1, iy + k, w, h), Get(c, ix, iy + k, w, h), Get(c, ix + 1, iy + k, w, h), Get(c, ix + 2, iy + k, w, h));
        return CR(fy, col[0], col[1], col[2], col[3]);
    }

    public static List<List<P>> Contours(float[,] c, int w, int h, int S, int pad, double iso)
    {
        int GW = (w + 2 * pad) * S, GH = (h + 2 * pad) * S;
        var F = new double[GW, GH];
        for (int u = 0; u < GW; u++) for (int v = 0; v < GH; v++)
            F[u, v] = Sample(c, w, h, (u + 0.5) / S - pad, (v + 0.5) / S - pad);

        // edge keys: horizontal h(i,j) = 2*(j*GW+i), vertical v(i,j) = 2*(j*GW+i)+1
        var pos = new Dictionary<long, P>();
        var adj = new Dictionary<long, List<long>>();
        Func<int, int, long> HK = (i, j) => 2L * ((long)j * GW + i);
        Func<int, int, long> VK = (i, j) => 2L * ((long)j * GW + i) + 1;
        Func<double, double, double> T = (a, b) => (iso - a) / (b - a);
        Action<long, long> link = (a, b) =>
        {
            if (!adj.ContainsKey(a)) adj[a] = new List<long>();
            if (!adj.ContainsKey(b)) adj[b] = new List<long>();
            adj[a].Add(b); adj[b].Add(a);
        };
        for (int i = 0; i < GW - 1; i++)
            for (int j = 0; j < GH - 1; j++)
            {
                double tl = F[i, j], tr = F[i + 1, j], br = F[i + 1, j + 1], bl = F[i, j + 1];
                int cs = (tl >= iso ? 8 : 0) | (tr >= iso ? 4 : 0) | (br >= iso ? 2 : 0) | (bl >= iso ? 1 : 0);
                if (cs == 0 || cs == 15) continue;
                long top = HK(i, j), bottom = HK(i, j + 1), left = VK(i, j), right = VK(i + 1, j);
                if ((tl >= iso) != (tr >= iso) && !pos.ContainsKey(top)) pos[top] = new P(i + T(tl, tr), j);
                if ((bl >= iso) != (br >= iso) && !pos.ContainsKey(bottom)) pos[bottom] = new P(i + T(bl, br), j + 1);
                if ((tl >= iso) != (bl >= iso) && !pos.ContainsKey(left)) pos[left] = new P(i, j + T(tl, bl));
                if ((tr >= iso) != (br >= iso) && !pos.ContainsKey(right)) pos[right] = new P(i + 1, j + T(tr, br));
                bool centre = (tl + tr + br + bl) / 4 >= iso;
                switch (cs)
                {
                    case 1: link(left, bottom); break;
                    case 2: link(bottom, right); break;
                    case 3: link(left, right); break;
                    case 4: link(top, right); break;
                    case 5: if (centre) { link(left, top); link(bottom, right); } else { link(top, right); link(left, bottom); } break;
                    case 6: link(top, bottom); break;
                    case 7: link(left, top); break;
                    case 8: link(left, top); break;
                    case 9: link(top, bottom); break;
                    case 10: if (centre) { link(top, right); link(left, bottom); } else { link(left, top); link(bottom, right); } break;
                    case 11: link(top, right); break;
                    case 12: link(left, right); break;
                    case 13: link(bottom, right); break;
                    case 14: link(left, bottom); break;
                }
            }

        var seen = new HashSet<long>();
        var loops = new List<List<P>>();
        foreach (var start in adj.Keys)
        {
            if (seen.Contains(start)) continue;
            var pts = new List<P>();
            long prev = -1, cur = start;
            while (true)
            {
                seen.Add(cur);
                var g = pos[cur];
                // grid coords -> original pixel coords
                pts.Add(new P((g.X + 0.5) / S - pad, (g.Y + 0.5) / S - pad));
                var nb = adj[cur];
                long next = nb[0] != prev ? nb[0] : (nb.Count > 1 ? nb[1] : -1);
                if (next == -1 || next == start) break;
                if (seen.Contains(next)) break;
                prev = cur; cur = next;
            }
            if (pts.Count > 4) loops.Add(pts);
        }
        return loops;
    }

    // Gaussian smoothing along arc length that leaves detected corners in place.
    public static List<P> SmoothClosed(List<P> pts, double sigma, double cornerDeg, double cornerScale)
    {
        int n = pts.Count;
        var s = new double[n + 1];
        for (int i = 1; i <= n; i++) s[i] = s[i - 1] + Len(Sub(pts[i % n], pts[i - 1]));
        double total = s[n];
        Func<int, double, int> walk = (i, d) =>
        {
            // index reached by walking arc length d (signed) from i
            int k = i; double acc = 0; int step = d > 0 ? 1 : -1;
            while (acc < Math.Abs(d)) { int nk = (k + step + n) % n; acc += Len(Sub(pts[nk], pts[k])); k = nk; if (k == i) break; }
            return k;
        };
        var turn = new double[n];
        for (int i = 0; i < n; i++)
        {
            var a = Norm(Sub(pts[i], pts[walk(i, -cornerScale)])); var b = Norm(Sub(pts[walk(i, cornerScale)], pts[i]));
            turn[i] = Math.Acos(Math.Max(-1, Math.Min(1, a.X * b.X + a.Y * b.Y))) * 180 / Math.PI;
        }
        var corner = new bool[n];
        for (int i = 0; i < n; i++)
        {
            if (turn[i] < cornerDeg) continue;
            bool isMax = true;
            int lo = walk(i, -cornerScale), hi = walk(i, cornerScale);
            for (int k = lo; k != hi; k = (k + 1) % n) if (turn[k] > turn[i] || (turn[k] == turn[i] && k < i && k != i)) { if (k != i) { isMax = false; break; } }
            corner[i] = isMax;
        }
        var outp = new List<P>(n);
        double R = 3 * sigma;
        for (int i = 0; i < n; i++)
        {
            if (corner[i] || sigma <= 0) { outp.Add(pts[i]); continue; }
            double sx = pts[i].X, sy = pts[i].Y, sw = 1;
            for (int dir = -1; dir <= 1; dir += 2)
            {
                int k = i; double acc = 0;
                while (true)
                {
                    int nk = (k + dir + n) % n; if (nk == i) break;
                    acc += Len(Sub(pts[nk], pts[k])); k = nk;
                    if (acc > R) break;
                    double wgt = Math.Exp(-acc * acc / (2 * sigma * sigma));
                    sx += pts[k].X * wgt; sy += pts[k].Y * wgt; sw += wgt;
                    if (corner[k]) break;
                }
            }
            outp.Add(new P(sx / sw, sy / sw));
        }
        return outp;
    }

    static double DistSeg(P p, P a, P b)
    {
        double dx = b.X - a.X, dy = b.Y - a.Y, L = dx * dx + dy * dy;
        double t = L == 0 ? 0 : Math.Max(0, Math.Min(1, ((p.X - a.X) * dx + (p.Y - a.Y) * dy) / L));
        double ex = a.X + t * dx - p.X, ey = a.Y + t * dy - p.Y;
        return Math.Sqrt(ex * ex + ey * ey);
    }

    static void RDP(List<P> pts, int s, int e, double eps, List<int> keep)
    {
        double md = 0; int mi = -1;
        for (int i = s + 1; i < e; i++) { double d = DistSeg(pts[i], pts[s], pts[e]); if (d > md) { md = d; mi = i; } }
        if (md > eps) { RDP(pts, s, mi, eps, keep); keep.Add(mi); RDP(pts, mi, e, eps, keep); }
    }

    public static List<P> SimplifyClosed(List<P> pts, double eps)
    {
        // split at the point farthest from pts[0] to anchor the closed loop
        int far = 0; double fd = 0;
        for (int i = 0; i < pts.Count; i++) { double dx = pts[i].X - pts[0].X, dy = pts[i].Y - pts[0].Y, d = dx * dx + dy * dy; if (d > fd) { fd = d; far = i; } }
        var ring = new List<P>(pts); ring.Add(pts[0]);
        var keep = new List<int> { 0 };
        RDP(ring, 0, far, eps, keep); keep.Add(far);
        RDP(ring, far, ring.Count - 1, eps, keep);
        keep.Sort();
        return keep.Distinct().Select(i => ring[i]).ToList();
    }

    static P Norm(P v) { double l = Math.Sqrt(v.X * v.X + v.Y * v.Y); return l == 0 ? new P(0, 0) : new P(v.X / l, v.Y / l); }
    static P Sub(P a, P b) { return new P(a.X - b.X, a.Y - b.Y); }
    static double Len(P v) { return Math.Sqrt(v.X * v.X + v.Y * v.Y); }

    public static Loop Fit(List<P> p, double cornerDeg)
    {
        int n = p.Count;
        var corner = new bool[n];
        for (int i = 0; i < n; i++)
        {
            var a = Norm(Sub(p[i], p[(i - 1 + n) % n])); var b = Norm(Sub(p[(i + 1) % n], p[i]));
            double dot = Math.Max(-1, Math.Min(1, a.X * b.X + a.Y * b.Y));
            corner[i] = Math.Acos(dot) * 180 / Math.PI > cornerDeg;
        }
        var lp = new Loop();
        for (int i = 0; i < n; i++)
        {
            P A = p[i], B = p[(i + 1) % n];
            P dirAB = Norm(Sub(B, A));
            P tA = corner[i] ? dirAB : Norm(Sub(p[(i + 1) % n], p[(i - 1 + n) % n]));
            P tB = corner[(i + 1) % n] ? dirAB : Norm(Sub(p[(i + 2) % n], p[i]));
            double L = Len(Sub(B, A)) / 3;
            lp.Segs.Add(new Seg { A = A, B = B, C1 = new P(A.X + tA.X * L, A.Y + tA.Y * L), C2 = new P(B.X - tB.X * L, B.Y - tB.Y * L) });
        }
        lp.MinX = p.Min(q => q.X); lp.MaxX = p.Max(q => q.X); lp.MinY = p.Min(q => q.Y); lp.MaxY = p.Max(q => q.Y);
        double ar = 0; for (int i = 0; i < n; i++) ar += p[i].X * p[(i + 1) % n].Y - p[(i + 1) % n].X * p[i].Y;
        lp.Area = Math.Abs(ar / 2);
        return lp;
    }

    static string F(double v) { return Math.Round(v, 2).ToString("0.##", IC); }

    public static string PathData(IEnumerable<Loop> loops, double ox, double oy)
    {
        var sb = new StringBuilder();
        foreach (var l in loops)
        {
            var s0 = l.Segs[0];
            sb.Append("M" + F(s0.A.X - ox) + " " + F(s0.A.Y - oy));
            foreach (var s in l.Segs)
                sb.Append("C" + F(s.C1.X - ox) + " " + F(s.C1.Y - oy) + " " + F(s.C2.X - ox) + " " + F(s.C2.Y - oy) + " " + F(s.B.X - ox) + " " + F(s.B.Y - oy));
            sb.Append("Z");
        }
        return sb.ToString();
    }

    public static GraphicsPath ToGdi(IEnumerable<Loop> loops, double scale)
    {
        var gp = new GraphicsPath(FillMode.Alternate);
        foreach (var l in loops)
        {
            gp.StartFigure();
            foreach (var s in l.Segs)
                gp.AddBezier((float)(s.A.X * scale), (float)(s.A.Y * scale), (float)(s.C1.X * scale), (float)(s.C1.Y * scale), (float)(s.C2.X * scale), (float)(s.C2.Y * scale), (float)(s.B.X * scale), (float)(s.B.Y * scale));
            gp.CloseFigure();
        }
        return gp;
    }

    public static void Render(IEnumerable<Loop> loops, int w, int h, double scale, Color fg, Color bg, string outPath)
    {
        using (var bmp = new Bitmap((int)(w * scale), (int)(h * scale), PixelFormat.Format32bppArgb))
        using (var g = Graphics.FromImage(bmp))
        using (var gp = ToGdi(loops, scale))
        {
            g.SmoothingMode = SmoothingMode.AntiAlias; g.Clear(bg);
            using (var br = new SolidBrush(fg)) g.FillPath(br, gp);
            bmp.Save(outPath, ImageFormat.Png);
        }
    }

    // Mean absolute coverage difference vs. original, rendering at 4x and box-downsampling.
    public static double Compare(IEnumerable<Loop> loops, float[,] cov, int w, int h, out double maxDiff, out double iou)
    {
        int S = 4;
        using (var bmp = new Bitmap(w * S, h * S, PixelFormat.Format32bppArgb))
        using (var g = Graphics.FromImage(bmp))
        using (var gp = ToGdi(loops, S))
        {
            g.SmoothingMode = SmoothingMode.AntiAlias; g.Clear(Color.Transparent);
            g.FillPath(Brushes.Black, gp);
            double sum = 0; maxDiff = 0; double inter = 0, uni = 0;
            for (int x = 0; x < w; x++) for (int y = 0; y < h; y++)
                {
                    double a = 0;
                    for (int i = 0; i < S; i++) for (int j = 0; j < S; j++) a += bmp.GetPixel(x * S + i, y * S + j).A;
                    a /= (S * S * 255.0);
                    double d = Math.Abs(a - cov[x, y]); sum += d; if (d > maxDiff) maxDiff = d;
                    inter += Math.Min(a, cov[x, y]); uni += Math.Max(a, cov[x, y]);
                }
            iou = inter / uni;
            return sum / (w * h);
        }
    }
}
