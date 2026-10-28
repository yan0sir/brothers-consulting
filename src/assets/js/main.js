// Brothers Consulting — progressive enhancements. The site works fully without this file.
(function () {
  var root = document.documentElement;
  root.classList.add('js');

  // Header: dark while over the dark hero, light once the hero has scrolled past
  var header = document.querySelector('.site-header');
  var heroEl = document.querySelector('[data-hero]');
  function onScroll() {
    if (!header) return;
    var past = heroEl ? heroEl.getBoundingClientRect().bottom <= header.offsetHeight : window.scrollY > 8;
    header.classList.toggle('is-scrolled', past);
  }
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });

  // Hero headline: lines rise out of a mask once, on load
  var heroTitle = document.querySelector('.hero__title');
  if (heroTitle && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    heroTitle.classList.add('lines-ready');
    window.requestAnimationFrame(function () {
      window.requestAnimationFrame(function () { heroTitle.classList.add('lines-in'); });
    });
    window.setTimeout(function () { heroTitle.classList.add('lines-in'); }, 1200);
  }

  // Mobile menu
  var toggle = document.querySelector('.menu-toggle');
  var menu = document.getElementById('mobile-menu');
  function setMenu(open) {
    if (!toggle || !menu) return;
    toggle.setAttribute('aria-expanded', String(open));
    toggle.querySelector('.menu-toggle__label').textContent = open ? toggle.dataset.closeLabel : toggle.dataset.openLabel;
    menu.hidden = !open;
    document.body.classList.toggle('menu-open', open);
    if (open) { var first = menu.querySelector('a'); if (first) first.focus(); }
  }
  if (toggle && menu) {
    toggle.addEventListener('click', function () { setMenu(toggle.getAttribute('aria-expanded') !== 'true'); });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') { setMenu(false); toggle.focus(); }
    });
    window.matchMedia('(min-width: 1024px)').addEventListener('change', function (mq) { if (mq.matches) setMenu(false); });
  }

  // Mobile contact bar: visible after the hero, hidden over the footer
  var bar = document.querySelector('.contact-bar');
  var hero = document.querySelector('[data-hero]');
  var footer = document.querySelector('.site-footer');
  if (bar) {
    var updateBar = function () {
      var vh = window.innerHeight;
      var pastHero = !hero || hero.getBoundingClientRect().bottom <= 0;
      var footerInView = !!footer && footer.getBoundingClientRect().top < vh;
      bar.classList.toggle('is-visible', pastHero && !footerInView);
    };
    var ticking = false;
    window.addEventListener('scroll', function () {
      if (ticking) return;
      ticking = true;
      window.requestAnimationFrame(function () { ticking = false; updateBar(); });
    }, { passive: true });
    window.addEventListener('resize', updateBar);
    updateBar();
  }

  // Reveal on scroll (once)
  var items = document.querySelectorAll('[data-reveal]');
  if ('IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    var ro = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { en.target.classList.add('is-visible'); ro.unobserve(en.target); }
      });
    }, { rootMargin: '0px 0px -8% 0px', threshold: 0.05 });
    var vh = window.innerHeight || document.documentElement.clientHeight || 900;
    // Safety net: never leave content hidden if the observer doesn't fire (thumbnails, unusual viewers).
    window.setTimeout(function () {
      document.querySelectorAll('.reveal-pending').forEach(function (el) { el.classList.add('is-visible'); });
    }, 3000);
    items.forEach(function (el) {
      // Anything on screen at load stays visible; only content below the fold animates in.
      if (el.getBoundingClientRect().top < vh) { el.classList.add('is-visible'); return; }
      var d = el.getAttribute('data-reveal-delay');
      if (d) el.style.transitionDelay = d + 'ms';
      el.classList.add('reveal-pending');
      ro.observe(el);
    });
  } else {
    items.forEach(function (el) { el.classList.add('is-visible'); });
  }

  // Current year
  document.querySelectorAll('[data-year]').forEach(function (el) { el.textContent = new Date().getFullYear(); });
})();

// Language menu: close on outside click or Escape
(function () {
  var menus = document.querySelectorAll('.lang-menu');
  if (!menus.length) return;
  document.addEventListener('click', function (e) {
    menus.forEach(function (m) { if (m.open && !m.contains(e.target)) m.open = false; });
  });
  document.addEventListener('keydown', function (e) {
    if (e.key !== 'Escape') return;
    menus.forEach(function (m) { if (m.open) { m.open = false; m.querySelector('summary').focus(); } });
  });
})();

// Services split: the sticky visual follows the hovered or focused service
(function () {
  var visual = document.querySelector('.svc__visual');
  var items = document.querySelectorAll('.svc-item');
  if (!visual || !items.length) return;
  var num = visual.querySelector('[data-svc-num]');
  var name = visual.querySelector('[data-svc-name]');
  function activate(item) {
    items.forEach(function (i) { i.classList.toggle('is-active', i === item); });
    visual.setAttribute('data-active', item.getAttribute('data-svc'));
    if (num) num.textContent = item.querySelector('.svc-item__num').textContent;
    if (name) name.textContent = item.querySelector('h3').textContent;
  }
  items.forEach(function (item) {
    item.addEventListener('focus', function () { activate(item); });
  });

  // As the list scrolls past the sticky panel, the service nearest the middle of the screen becomes active
  var desktop = window.matchMedia('(min-width: 1024px)');
  var current = null, ticking = false;
  function sync() {
    ticking = false;
    if (!desktop.matches) return;
    var mid = (window.innerHeight || document.documentElement.clientHeight) / 2, best = null, bestDist = Infinity;
    items.forEach(function (i) {
      var r = i.getBoundingClientRect();
      var d = Math.abs(r.top + r.height / 2 - mid);
      if (d < bestDist) { bestDist = d; best = i; }
    });
    if (best && best !== current) { current = best; activate(best); }
  }
  window.addEventListener('scroll', function () {
    if (!ticking) { ticking = true; window.setTimeout(sync, 60); }
  }, { passive: true });
  window.addEventListener('resize', sync);
  sync();
})();


// Hero outline: the light on the shape nearest the pointer glides (slowly) to the pointer;
// the other shape's light keeps running. On leave, it resumes its loop from where it is.
(function () {
  if (!window.matchMedia('(hover: hover) and (pointer: fine)').matches) return;
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  var LEN = 1000, SAMPLES = 240;
  var LAYER = { l1: 300, l2: 230, l3: 170, l4: 115, l5: 70, l6: 32 };
  function layerLen(p) { for (var k in LAYER) if (p.classList.contains(k)) return LAYER[k]; return 0; }
  function curOffset(p) { return parseFloat(getComputedStyle(p).strokeDashoffset) || 0; }
  function norm(v) { return ((v % LEN) + LEN) % LEN; }

  document.querySelectorAll('.qhero .markline, .cta-split .markline').forEach(function (svg) {
    var bases = svg.querySelectorAll('.markline__base path');
    var shapes = [0, 1].map(function (i) {
      var base = bases[i], total = base.getTotalLength(), pts = [];
      for (var k = 0; k < SAMPLES; k++) { var q = base.getPointAtLength(total * k / SAMPLES); pts.push({ x: q.x, y: q.y, at: LEN * k / SAMPLES }); }
      return { pts: pts, layers: svg.querySelectorAll('.markline__trail .s' + (i + 1)), tracking: false };
    });

    function track(s, at) {
      s.layers.forEach(function (p) {
        if (!s.tracking) {
          // freeze at the current animated position, then glide from there
          p.style.strokeDashoffset = String(curOffset(p));
          p.style.animation = 'none';
          void p.getBoundingClientRect();
          p.classList.add('is-tracking');
        }
        var cur = parseFloat(p.style.strokeDashoffset) || 0;
        var target = layerLen(p) / 2 - at;
        target += LEN * Math.round((cur - target) / LEN); // take the short way round
        p.style.strokeDashoffset = String(target);
      });
      s.tracking = true;
    }
    function release(s) {
      if (!s.tracking) return;
      s.layers.forEach(function (p) {
        var off = norm(curOffset(p));
        var dur = parseFloat(getComputedStyle(p).getPropertyValue('--dur')) || 8;
        p.classList.remove('is-tracking');
        p.style.strokeDashoffset = '';
        p.style.animation = '';
        // resume the loop exactly where the light is now (keyframes run 1000 -> 0)
        p.style.animationDelay = (-((LEN - off) / LEN) * dur) + 's';
      });
      s.tracking = false;
    }
    function toSvg(e) {
      var m = svg.getScreenCTM(); if (!m) return null;
      var pt = svg.createSVGPoint(); pt.x = e.clientX; pt.y = e.clientY;
      return pt.matrixTransform(m.inverse());
    }
    svg.addEventListener('pointermove', function (e) {
      var q = toSvg(e); if (!q) return;
      var best = null;
      shapes.forEach(function (s, i) {
        s.pts.forEach(function (p) {
          var d = (p.x - q.x) * (p.x - q.x) + (p.y - q.y) * (p.y - q.y);
          if (!best || d < best.d) best = { d: d, i: i, at: p.at };
        });
      });
      shapes.forEach(function (s, i) { if (i === best.i) track(s, best.at); else release(s); });
    });
    svg.addEventListener('pointerleave', function () { shapes.forEach(release); });
  });
})();

// "What we do" statement: words light up as the paragraph scrolls through the viewport
(function () {
  var el = document.querySelector('[data-light-words]');
  if (!el || window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  var words = el.textContent.trim().split(/\s+/);
  el.textContent = '';
  var spans = words.map(function (w, i) {
    var s = document.createElement('span'); s.className = 'w'; s.textContent = w;
    el.appendChild(s); if (i < words.length - 1) el.appendChild(document.createTextNode(' '));
    return s;
  });
  el.setAttribute('aria-label', words.join(' '));
  var ticking = false;
  function update() {
    ticking = false;
    var vh = window.innerHeight || document.documentElement.clientHeight;
    var r = el.getBoundingClientRect();
    // 0 when the paragraph's top reaches 85% of the screen, 1 when its bottom reaches 45%
    var p = (vh * 0.85 - r.top) / ((vh * 0.85 - vh * 0.45) + r.height);
    p = Math.max(0, Math.min(1, p));
    var lit = Math.round(p * spans.length);
    spans.forEach(function (s, i) { s.classList.toggle('is-lit', i < lit); });
  }
  window.addEventListener('scroll', function () { if (!ticking) { ticking = true; window.setTimeout(update, 30); } }, { passive: true });
  window.addEventListener('resize', update);
  update();
})();
// "Advice you can act on": start the card lines once the cards come into view
(function () {
  var stairs = document.querySelector('.stairs');
  if (!stairs) return;
  if (!('IntersectionObserver' in window)) { stairs.classList.add('is-drawn'); return; }
  var io = new IntersectionObserver(function (entries) {
    if (entries[0].isIntersecting) { stairs.classList.add('is-drawn'); io.disconnect(); }
  }, { threshold: 0.3 });
  io.observe(stairs);
})();

// Smooth, eased scrolling for mouse wheel and trackpad (touch keeps the native feel).
// Uses native scroll underneath, so sticky elements and scroll-driven effects keep working.
(function () {
  if (!window.Lenis || window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  var lenis = new window.Lenis({ duration: 1.15, easing: function (t) { return Math.min(1, 1.001 - Math.pow(2, -10 * t)); }, smoothWheel: true });
  function raf(time) { lenis.raf(time); window.requestAnimationFrame(raf); }
  window.requestAnimationFrame(raf);
  // In-page links glide to their target and stop clear of the floating nav
  document.addEventListener('click', function (e) {
    var a = e.target.closest('a[href^="#"]');
    if (!a || a.getAttribute('href').length < 2) return;
    var target = document.getElementById(decodeURIComponent(a.getAttribute('href').slice(1)));
    if (!target) return;
    e.preventDefault();
    var header = document.querySelector('.site-header');
    lenis.scrollTo(target, { offset: -((header ? header.offsetHeight : 0) + 26) });
    history.pushState(null, '', a.getAttribute('href'));
  });
  // Pause while the mobile menu is open
  var toggle = document.querySelector('.menu-toggle');
  if (toggle) new MutationObserver(function () {
    if (document.body.classList.contains('menu-open')) lenis.stop(); else lenis.start();
  }).observe(document.body, { attributes: true, attributeFilter: ['class'] });
})();
