// Modern site interactions: theme, smooth scroll, modal, tilt, form
function initTheme() {
  const stored = localStorage.getItem("site-theme") || "dark";
  document.documentElement.setAttribute("data-theme", stored);
  updateThemeButton(stored);
}

function toggleTheme() {
  const current = document.documentElement.getAttribute("data-theme") || "dark";
  const next = current === "dark" ? "light" : "dark";
  document.documentElement.setAttribute("data-theme", next);
  localStorage.setItem("site-theme", next);
  updateThemeButton(next);
}

function updateThemeButton(theme) {
  const btn = document.getElementById("theme-toggle");
  if (!btn) return;
  btn.textContent = theme === "dark" ? "🌙" : "☀️";
}

// Sticky nav subtle handling
function handleStickyNav() {
  const header = document.querySelector(".site-header");
  if (!header) return;
  const offset = 40;
  window.addEventListener("scroll", () => {
    if (window.scrollY > offset) header.classList.add("scrolled");
    else header.classList.remove("scrolled");
  });
}

// Intersection-based reveal
function initScrollAnimations() {
  if (!("IntersectionObserver" in window)) return;
  const io = new IntersectionObserver(
    (entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          e.target.classList.add("in-view");
          io.unobserve(e.target);
        }
      });
    },
    { threshold: 0.12 }
  );
  document.querySelectorAll(".section, .project-card, .skill").forEach((el) => {
    el.classList.add("will-reveal");
    io.observe(el);
  });
}

// Smooth anchor scrolling
function enhanceSmoothScroll() {
  document.querySelectorAll('a[href^="#"]').forEach((a) => {
    a.addEventListener("click", (e) => {
      const href = a.getAttribute("href");
      if (href === "#" || href === "") return;
      const target = document.querySelector(href);
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: "smooth", block: "start" });
      }
    });
  });
}

// Modal preview for screenshots
function initModalPreview() {
  const modal = document.getElementById("modal");
  const modalImg = document.getElementById("modal-img");
  const close = modal.querySelector(".modal-close");

  document.querySelectorAll(".screens-grid img").forEach((img) => {
    img.addEventListener("click", () => {
      modalImg.src = img.src;
      modal.setAttribute("aria-hidden", "false");
    });
  });

  close.addEventListener("click", () => {
    closeModal();
  });
  modal.addEventListener("click", (e) => {
    if (e.target === modal) closeModal();
  });
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") closeModal();
  });

  function closeModal() {
    modal.setAttribute("aria-hidden", "true");
    modalImg.src = "";
  }
}

// Project card subtle tilt using pointermove
function initTilt() {
  const card = document.querySelector(".project-card");
  if (!card) return;
  card.addEventListener("pointermove", (e) => {
    const rect = card.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width;
    const y = (e.clientY - rect.top) / rect.height;
    const rx = (y - 0.5) * 6;
    const ry = (x - 0.5) * -6;
    card.style.transform = `perspective(900px) rotateX(${rx}deg) rotateY(${ry}deg) translateZ(4px)`;
  });
  card.addEventListener("pointerleave", () => {
    card.style.transform = "";
  });
}

// Contact form stubbed submission (no backend)
function handleContactSubmit(e) {
  e.preventDefault();
  const btn = e.target.querySelector('button[type="submit"]');
  const old = btn.textContent;
  btn.textContent = "Sending...";
  btn.disabled = true;
  setTimeout(() => {
    btn.textContent = "Message sent ✓";
    btn.style.background = "linear-gradient(90deg,#06b6d4,#0ea5e9)";
    e.target.reset();
    setTimeout(() => {
      btn.textContent = old;
      btn.disabled = false;
      btn.style.background = "";
    }, 2200);
  }, 900);
}

// Keyboard shortcuts
function initKeyboardShortcuts() {
  document.addEventListener("keydown", (e) => {
    if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === "k") {
      e.preventDefault();
      document.getElementById("contact").scrollIntoView({ behavior: "smooth" });
    }
    if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === "j") {
      e.preventDefault();
      toggleTheme();
    }
  });
}

document.addEventListener("DOMContentLoaded", () => {
  initTheme();
  handleStickyNav();
  initScrollAnimations();
  enhanceSmoothScroll();
  initModalPreview();
  initTilt();
  initKeyboardShortcuts();

  const tbtn = document.getElementById("theme-toggle");
  if (tbtn) tbtn.addEventListener("click", toggleTheme);
  const form = document.getElementById("contact-form");
  if (form) form.addEventListener("submit", handleContactSubmit);

  // Live demo button placeholder guidance
  const demo = document.getElementById("live-demo-btn");
  if (demo) {
    demo.addEventListener("click", (e) => {
      e.preventDefault();
      alert(
        "Live demo not deployed yet. Replace this link with your demo URL via edit."
      );
    });
  }
});
