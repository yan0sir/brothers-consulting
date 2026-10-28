# Copy Deck — English (Draft v1)

_Written 2026-10-19 at the developer's request, because the client has no copy yet. **Every line is a draft for the client to approve.** British English. Arabic will be written later from the approved English, adapted rather than translated word for word._

Each string has a key (e.g. `home.hero.title`) so it can move straight into the locale files. `[[PLACEHOLDER]]` marks a value the client still has to supply.

---

## 0. Before publishing: claims the client must confirm

The copy deliberately makes **no** factual claims: no years in business, client numbers, results, credentials, awards or testimonials. It does describe *how the firm works*. Those descriptions are promises, so the client has to confirm each one is true or the line is changed:

- [ ] Clients work **directly with senior people** (`home.why.1`, `about.principles.1`)
- [ ] **Scope, timeline and fees are agreed in writing before work starts** (`home.process.3`)
- [ ] The **first conversation carries no obligation or charge** (`home.process.1`, `contact.intro`)
- [ ] Engagements are offered in **both English and Arabic** (`home.why.2`)
- [ ] The **five areas of focus** are services the firm is willing to offer (`services.*`)
- [ ] The **types of client** listed are ones the firm wants (`about.clients`)

---

## 1. Global

| Key | Copy |
|---|---|
| `site.name` | Brothers Consulting |
| `site.legalName` | Brothers Consulting Company W.L.L |
| `nav.about` | About |
| `nav.services` | Services |
| `nav.contact` | Contact |
| `nav.langSwitch` | عربي |
| `cta.whatsapp` | WhatsApp us |
| `cta.call` | Call us |
| `cta.whatsapp.message` | Hello Brothers Consulting, I'd like to talk about… |
| `contact.phone` | `[[PHONE +973]]` |
| `contact.whatsapp` | `[[WHATSAPP NUMBER +973]]` |
| `contact.email` | `[[EMAIL]]` |
| `contact.hours` | `[[HOURS — e.g. Sunday to Thursday, 8:00–17:00 (Bahrain time)]]` |
| `contact.address` | `[[OFFICE ADDRESS]]`, Kingdom of Bahrain |
| `footer.tagline` | Consulting, based in Bahrain. |
| `footer.cr` | CR No. `[[CR NUMBER]]` |
| `footer.copyright` | © {year} Brothers Consulting Company W.L.L. All rights reserved. |
| `footer.privacy` / `footer.terms` | Privacy · Terms |
| `a11y.skip` | Skip to content |
| `a11y.menuOpen` / `a11y.menuClose` | Open menu / Close menu |

---

## 2. Home (`/`)

**Meta**
- `home.meta.title`: Brothers Consulting | Consulting in Bahrain
- `home.meta.description`: Brothers Consulting is a Bahrain-based consultancy helping business owners and leadership teams make clear decisions and put them into practice. (~150 characters)

**Hero**
- `home.hero.title`: Clear thinking for decisions that matter. _(v2: shortened to suit the oversized uppercase hero)_
- `home.hero.body`: We're a Bahrain-based consultancy. We work alongside business owners and leadership teams to make sense of complex choices, and then make them happen.
- CTAs: `cta.whatsapp` · `cta.call`

**Introduction**
- `home.intro.eyebrow`: Who we are
- `home.intro.title`: Good advice starts with listening.
- `home.intro.body`: Every business reaches moments where the next step isn't obvious: a new market, a growing team, a process that no longer keeps up, a decision that can't wait. Brothers Consulting helps you see those moments clearly. We take the time to understand how your business really works, give you an honest view, and stay with you while the work gets done.

**Areas of focus**
- `home.services.eyebrow`: What we do
- `home.services.title`: Areas of focus
- `home.services.link`: All services
- Items (titles and one-liners; full text on the Services page):
  1. **Strategy & Growth**: Setting direction, choosing where to compete, and building a plan your team can follow.
  2. **Operations & Performance**: Simplifying how work gets done so the business runs faster, leaner and with fewer surprises.
  3. **Organisation & People**: Structures, roles and ways of working that let good people do their best work.
  4. **Market Entry & Expansion**: Practical support for companies entering Bahrain or growing across the region.
  5. **Projects & Transformation**: Turning important initiatives into delivered results, on time and in step with the business.

**Why us**
- `home.why.eyebrow`: Why Brothers Consulting
- `home.why.title`: Advice you can act on.
- `home.why.1`: **Senior attention.** You work directly with the people advising you, from the first conversation to the final recommendation.
- `home.why.2`: **Rooted in Bahrain.** We're based here and work in English and Arabic, so advice fits the way business is done locally.
- `home.why.3`: **Practical by design.** Recommendations come with clear next steps, owners and timelines, not just a report.
- `home.why.4`: **Straight talk.** We tell you what we see, plainly, even when it isn't what you expected to hear.

**How we work** (dark section)
- `home.process.eyebrow`: How we work
- `home.process.title`: A simple way to begin.
- `home.process.1`: **Start a conversation.** Message us on WhatsApp or give us a call. Tell us what's on your mind; there's no obligation.
- `home.process.2`: **Understand the situation.** We listen, ask questions, and look at what's really driving the challenge.
- `home.process.3`: **Agree a plan.** You get a clear proposal with scope, timeline and fees agreed before any work starts.
- `home.process.4`: **Deliver together.** We work alongside your team, keep you informed, and focus on results you can see.
- CTA: `cta.whatsapp`

**Contact band**
- `home.cta.title`: Have something on your mind? Let's talk it through.
- `home.cta.body`: The quickest way to reach us is WhatsApp. Prefer to talk? Call us during business hours.
- CTAs: `cta.whatsapp` · `cta.call` · phone number shown large · `contact.hours`

---

## 3. About (`/about`)

**Meta**
- `about.meta.title`: About | Brothers Consulting
- `about.meta.description`: A Bahrain-based consultancy built on listening first, speaking plainly and staying involved until the work is done.

**Hero**
- `about.hero.eyebrow`: About us
- `about.hero.title`: A consultancy built on partnership.
- `about.hero.body`: Brothers Consulting works with organisations in Bahrain that want a clear outside view and a partner who stays involved. We bring structure to complex questions and help turn decisions into progress.

**What we believe** (principles)
- `about.principles.title`: What we believe
- `about.principles.1`: **The people advising you should be the people working with you.** Senior involvement isn't an upgrade; it's how we work.
- `about.principles.2`: **Understanding comes before answers.** Every business is different, so we start with questions rather than templates.
- `about.principles.3`: **Good advice is advice that gets used.** We measure our work by what changes in your business.
- `about.principles.4`: **Honesty builds trust.** We'll tell you what we think, and why, in plain language.

**Who we work with**
- `about.clients.title`: Who we work with
- `about.clients.body`: We work with organisations at moments of change: growing businesses, established companies rethinking how they operate, family-owned enterprises planning their next chapter, and international firms establishing themselves in Bahrain.

**Closing CTA**
- `about.cta.title`: Let's start with a conversation.
- CTAs: `cta.whatsapp` · `cta.call`

_Leadership section: omitted until the client supplies names, roles and bios._

---

## 4. Services (`/services`)

**Meta**
- `services.meta.title`: Services | Brothers Consulting
- `services.meta.description`: Strategy, operations, organisation, market entry and transformation support for businesses in Bahrain.

**Hero**
- `services.hero.eyebrow`: Services
- `services.hero.title`: Focused support where it matters most.
- `services.hero.body`: Every engagement is shaped around your situation. These are the areas where we most often help. If your question doesn't fit neatly into one of them, talk to us anyway.

**01 · Strategy & Growth** (`#strategy`)
- `services.strategy.body`: When the direction is unclear or the options are many, we help you decide where to focus and how to get there. We look at your market, your strengths and your ambitions, and turn them into a plan your leadership team believes in and your people can follow.
- `services.strategy.questions` (_Questions we help answer_):
  - Where should we grow next, and what should we stop doing?
  - Is our current plan still the right one?
  - How do we turn our strategy into priorities for this year?

**02 · Operations & Performance** (`#operations`)
- `services.operations.body`: As businesses grow, the way work gets done often doesn't keep up. We map how things really run, find where time and money are lost, and redesign processes so the business runs more smoothly and predictably.
- `services.operations.questions`:
  - Why does everything take longer than it should?
  - Where are our costs going, and which can we reduce?
  - How do we scale without adding complexity?

**03 · Organisation & People** (`#organisation`)
- `services.organisation.body`: The right structure and clear responsibilities make everything else easier. We help you design how your organisation fits together (roles, reporting lines, decision-making and ways of working) so people can focus on doing their jobs well.
- `services.organisation.questions`:
  - Is our structure right for where we're heading?
  - Who should be making which decisions?
  - How do we prepare the organisation for growth or succession?

**04 · Market Entry & Expansion** (`#market-entry`)
- `services.market.body`: Entering a new market or expanding across the region raises many practical questions at once. We help you assess the opportunity, plan your approach and prepare to operate, with the benefit of a partner based in Bahrain.
- `services.market.questions`:
  - Is Bahrain the right base for our regional plans?
  - What do we need in place before we launch?
  - How should we approach partners and customers locally?

**05 · Projects & Transformation** (`#transformation`)
- `services.transformation.body`: Important initiatives often stall between the decision and the result. We help you plan, organise and lead change, keeping projects on track, people informed and the business running while it happens.
- `services.transformation.questions`:
  - How do we get this initiative delivered on time?
  - How do we bring our people along with the change?
  - Who should own what, and how will we know it's working?

**Closing CTA**
- `services.cta.title`: Not sure where your question fits?
- `services.cta.body`: Most conversations start with a challenge, not a service. Tell us what you're facing and we'll tell you honestly whether we can help.
- CTAs: `cta.whatsapp` · `cta.call`

---

## 5. Contact (`/contact`)

**Meta**
- `contact.meta.title`: Contact | Brothers Consulting
- `contact.meta.description`: Message Brothers Consulting on WhatsApp or call us. We're based in Bahrain.

**Content**
- `contact.title`: Let's talk.
- `contact.intro`: Tell us a little about what you're working on, and we'll take it from there. The first conversation is simply a chance to understand your situation; there's no obligation.
- `contact.whatsapp.title`: WhatsApp
- `contact.whatsapp.body`: The quickest way to reach us. Send a message any time and we'll reply during business hours.
- `contact.call.title`: Call
- `contact.call.body`: Prefer to talk? Call us during business hours.
- `contact.details.email`: Email · `[[EMAIL]]`
- `contact.details.hours`: Hours · `[[HOURS]]`
- `contact.details.office`: Office · `[[OFFICE ADDRESS]]`, Kingdom of Bahrain · Open in Maps →

---

## 6. Utility

- `notFound.title`: This page doesn't exist.
- `notFound.body`: It may have moved, or the link may be incorrect.
- `notFound.cta`: Back to home
- `mobileBar.whatsapp` / `mobileBar.call`: WhatsApp · Call
- `legal.pending`: This page is being prepared. _(Dev only; legal pages stay unlinked until their text arrives.)_

---

## 7. Voice notes (for the Arabic copywriter and future edits)

- **Calm, direct, warm.** Short sentences. "We" and "you", never "the client".
- **No superlatives** ("leading", "best-in-class", "world-class") and no claims that can't be proven.
- **Plain language.** If a phrase would sound odd said across a table, rewrite it.
- **Headlines are complete thoughts**, ending with a full stop.
- Arabic should keep the same tone in Modern Standard Arabic, written natively rather than translated literally.
