Performance & Optimization Checklist

- Image optimization

  - Convert `screenshots/` PNG/JPEG files to WebP: run `npm install` then `npm run convert-images` or run `.\scripts\convert-images.ps1` on PowerShell.
  - Verify `img` tags use `srcset`/`<picture>` where appropriate and lazy-loading.

- Lazy loading & skeletons

  - Images use `data-src`/`data-srcset` with `class="lazyload"`. The site JS will load them via IntersectionObserver.
  - Skeleton placeholders are shown until image load.

- Scroll animations

  - IntersectionObserver reveals `.fade-in` and `.will-reveal` elements.
  - Keep thresholds small (0.12) and use transforms for GPU acceleration.

- Parallax

  - Subtle transform on `#hero` via `initParallax()` to keep animation smooth.

- SEO

  - Meta tags added: canonical, Twitter card, Open Graph are present. Add unique page titles for subpages.

- Lighthouse guidance (target 90+)

  - Preload critical assets (fonts, hero image) if needed.
  - Reduce unused JS/CSS by moving to modular builds (consider React/Next migration for code splitting).
  - Serve images in WebP/AVIF where possible and use efficient caching headers when deploying.
  - Audit third-party scripts (Font Awesome, Tailwind CDN) — consider self-hosting or only loading used icons.

- Mobile

  - Test on breakpoints: 320, 375, 768, 1024, 1440.
  - Ensure touch target sizes >= 44px and form elements are accessible.
  - Verify contact form on mobile and ensure keyboard-friendly layout.

- Optional React migration
  - Create a small CRA/Vite app and use dynamic imports + `React.lazy` for code-splitting.
  - Use Framer Motion for motion components and `Suspense` fallback skeletons.

Commands

- Install dependencies and convert images:

```powershell
npm install
npm run convert-images
# or
pwsh .\scripts\convert-images.ps1
```

- Run Lighthouse locally via Chrome DevTools or `lighthouse` CLI.

Notes

- I added progressive enhancement scripts so existing static site benefits from lazy-loading and animations without a full build step. For aggressive code-splitting and Framer Motion usage, I recommend a small React/Vite migration; I can scaffold that next if you want.

Mobile & Accessibility Checklist (added)

- Hamburger menu:

  - Uses `aria-expanded` on `#mobileMenuBtn` and `aria-hidden` on `#mobileMenu` to expose state to assistive tech.
  - `Escape` closes the menu and focus returns to the toggle button.
  - Links inside the mobile menu use `role="menuitem"` for clarity.

- Touch targets & layout:

  - Buttons and interactive controls have a `min-height: 44px` and extra vertical padding for easier tapping.
  - Text elements use `overflow-wrap: anywhere` to avoid overflow on narrow viewports.

- Form testing:

  - Verify the contact form on mobile devices and ensure inputs are large enough and visible above the keyboard.
  - Ensure `label` elements are associated with inputs (use `for`/`id`) and check focus order.

- Breakpoints to verify visually: 320px, 375px, 768px, 1024px, 1440px.

- Lighthouse tips for mobile networks:
  - Preload critical hero/profile images (done). Consider AVIF for even smaller sizes.
  - Audit third-party scripts (Font Awesome, Tailwind CDN). Self-host or use icon subset SVGs to reduce transfer size.
  - Serve images from a CDN with proper caching headers.
