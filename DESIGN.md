# DESIGN.md — Tanya Sava Artist Website

## Overview
Personal artist website for **Tetiana Savushkina** (brand name: *Tanya Sava*).
Oil painting artist based in Roth, Deutschland. Style: elegant, gallery-quality, dark art-space aesthetic.

---

## Color Palette

### Base
| Token | Hex | Usage |
|---|---|---|
| `--color-bg-deep` | `#0a1628` | Footer, darkest surfaces |
| `--color-bg-primary` | `#0f1f3d` | Main page background |
| `--color-bg-card` | `#162848` | Cards, vernissage block |
| `--color-bg-elevated` | `#1a2f52` | Elevated cards, inner panels |
| `--color-bg-border` | `#1e3560` | Dividers, subtle borders |

### Accent — Green-Gold
| Token | Hex | Usage |
|---|---|---|
| `--color-accent` | `#b8d460` | Logo, headings accent, CTA borders, labels |
| `--color-accent-dark` | `#4a7c2a` | Hover states on accent |
| `--color-accent-tag-bg` | `#b8d460` | VERNISSAGE badge background |
| `--color-accent-tag-text` | `#0f1f3d` | Text on green badge |

### Text
| Token | Hex | Usage |
|---|---|---|
| `--color-text-primary` | `#e8eef8` | Main headings, important values |
| `--color-text-secondary` | `#8fa8c8` | Body text, nav links |
| `--color-text-muted` | `#6a88a8` | Labels, captions, dates |
| `--color-text-subtle` | `#4a6080` | Dividers text, footer secondary |

---

## Typography

### Fonts
- **Serif** (headings, name, italic quotes): `Georgia, 'Times New Roman', serif`
- **Sans** (nav, labels, UI): `'Helvetica Neue', Arial, sans-serif`

### Scale
| Role | Font | Size | Weight | Style | Notes |
|---|---|---|---|---|---|
| Artist name (large) | Serif | 56–72px | 400 | normal | Hero only |
| Artist alias | Serif | 40–52px | 400 | italic | Green accent color |
| Section heading | Serif | 28–36px | 400 | normal | |
| Tagline / quote | Serif | 16–18px | 400 | italic | Muted color |
| Nav links | Sans | 11px | 400 | normal | letter-spacing: 0.12em; uppercase |
| Section labels | Sans | 10–11px | 400 | normal | letter-spacing: 0.12em; uppercase; accent color |
| Date values | Sans | 18–20px | 500 | normal | |
| Body / descriptions | Serif | 15–16px | 400 | italic | line-height: 1.7 |
| Contact values | Sans | 14px | 500 | normal | |
| Footer | Sans | 10px | 400 | normal | letter-spacing: 0.12em; uppercase |

### Rules
- Section labels always preceded by a short horizontal rule: `────  LABEL TEXT`
- Nav links: uppercase, tracked, no bold
- Never use font-weight 600 or 700
- Italic serif for all poetic/descriptive copy

---

## Spacing & Layout

```
--spacing-xs:   4px
--spacing-sm:   8px
--spacing-md:  16px
--spacing-lg:  32px
--spacing-xl:  64px
--spacing-2xl: 96px

--border-radius-sm:  4px
--border-radius-md:  8px
--border-radius-lg: 12px

--max-width: 1100px
--section-padding: 80px 0
--container-padding: 0 40px   (mobile: 0 20px)
```

---

## Components

### Navigation
- Fixed top, full-width
- Background: `--color-bg-deep` with bottom border `1px solid --color-bg-border`
- Logo left: `Tanya` (regular) + ` Sava` (italic), both in `--color-accent`, serif 18px
- Links right: uppercase sans, `--color-text-secondary`, letter-spacing 0.12em
- No hover underline — use color shift to `--color-accent`

### Hero Section
- Two-column grid: `1fr 1fr`, gap 48px, align-items center
- Left: label + name block + tagline + CTA button
- Right: Vernissage card (see below)
- Background: `--color-bg-primary`

### Section Label
```html
<div class="section-label">
  <span class="rule"></span>
  <span>PERSÖNLICHE KUNSTAUSSTELLUNG</span>
</div>
```
- Rule: `24px wide, 1px height, background: --color-accent`
- Text: 10px, uppercase, letter-spacing 0.12em, `--color-accent`
- Display: flex, align-items center, gap 10px

### CTA Button (outline)
- Border: `1px solid --color-accent`
- Text: `--color-accent`, 10px, uppercase, letter-spacing 0.12em
- Background: transparent
- Padding: `10px 20px`
- Hover: background `rgba(168, 201, 122, 0.08)`
- No border-radius (sharp corners — gallery aesthetic)

### Vernissage Card
- Background: `--color-bg-card`
- Border-radius: `--border-radius-lg`
- Header badge: full-width, background `--color-accent`, text `--color-accent-tag-text`, 9px uppercase
- Image area: `--color-bg-elevated`, aspect-ratio 4/3, placeholder centered italic text
- Info grid: 2 columns, date labels + values
- Location block: accent-colored venue name, muted address
- All internal borders: `0.5px solid --color-bg-border`

### Contact Cards
- 3-column grid
- Each card: `border: 0.5px solid --color-bg-border`, padding 16px
- No border-radius (sharp corners)
- Label: 9px uppercase sans, `--color-text-muted`
- Value: 14px sans, 500, `--color-text-primary`
- Section background: `--color-bg-deep`

### Gallery Grid (Galerie page)
- CSS Grid: `repeat(auto-fill, minmax(280px, 1fr))`, gap 2px
- Images fill cells, object-fit: cover
- Hover: overlay with title + medium in italic serif
- No cards, no borders — images edge-to-edge

### Footer
- Background: `--color-bg-deep`
- Border-top: `0.5px solid --color-bg-border`
- Three items centered, separated by `·`
- Instagram in `--color-accent`, rest in `--color-text-subtle`
- 10px, uppercase, letter-spacing 0.12em

---

## Page Structure

```
/ (index)
  ├── <nav>          Logo + navigation links
  ├── <section#hero> Name + alias + tagline + CTA | Vernissage card
  ├── <section#kontakt> Contact cards (3-column)
  └── <footer>       Instagram · Name · City

/galerie
  ├── <nav>
  ├── <section> Gallery grid — oil paintings
  └── <footer>

/ausstellung
  ├── <nav>
  ├── <section> Exhibition details, full info, map embed
  └── <footer>
```

---

## Content

### Fixed Texts
- Artist full name: **Tetiana Savushkina**
- Brand name: **Tanya Sava** (always italic when standalone)
- Medium: *Malerei · Öl auf Leinwand*
- Tagline: *Natur, Licht und Stille in jedem Pinselstrich*
- Instagram: `@tanyasavaart`
- Email: `info@tanyasava.art`
- Phone: `Auf Anfrage`

### Event
- Vernissage: **17.04.2026, 18:00 Uhr**
- Exhibition: **18.04 – 17.07.2026**
- Venue: **Fenster in der Stadt (FIS)**, Kirchplatz, 91154 Roth
- Hours: Fr 14:00–17:30, Sa 10:00–12:30

---

## Tone & Copy Rules
- Language: **German** (primary), English meta tags
- Copy style: short, poetic, unhurried — art gallery voice
- No exclamation marks
- CTA text: `VERNISSAGE · 17. APRIL 2026` (not "Click here" etc.)
- Section labels never end in colon

---

## Assets
- Hero image: oil painting from exhibition poster (to be provided)
- Format: JPG, minimum 1200px wide
- No image filters or overlays — show painting as-is
- Favicon: monogram "TS" or simple brush stroke SVG

---

## Do & Don't

| Do | Don't |
|---|---|
| Sharp corners on buttons and contact cards | Rounded buttons |
| Italic serif for all poetic text | Sans-serif for taglines |
| Uppercase tracked labels | Title Case nav links |
| Thin borders (0.5–1px) | Heavy borders or shadows |
| Two-column hero layout | Centered single-column hero |
| Minimal whitespace — let painting breathe | Crowded sections |
| Green accent only for key moments | Green on every element |


---

## Hero Painting

- Title: *Haus mit roten Blättern* (working title — confirm with artist)
- Medium: Öl auf Leinwand
- Colors: deep red foliage, lush greens, white building facade, cobalt blue sky
- File: `painting-hero.jpg` (extract from poster or use original photo)
- Placement: vernissage card image area, aspect-ratio 4/3
- Note: painting colors (warm reds, greens) complement the dark blue background naturally — no color treatment needed
