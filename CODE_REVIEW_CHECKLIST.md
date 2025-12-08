# CourseLab Code Review Checklist

## Security (6 items)

- [ ] Verify Razorpay webhook signature validation exists and has unit tests covering valid/invalid signatures
- [ ] Confirm all sensitive credentials (API keys, database passwords, JWT secrets) are in `.env` files and never committed to Git
- [ ] Check CORS configuration is restrictive; only whitelists Vercel/Railway domains, not `*`
- [ ] Validate that Sanctum tokens are configured with appropriate expiry (max 1 hour) and refresh mechanisms
- [ ] Ensure CSRF protection is enabled on all POST/PUT/DELETE endpoints; verify token validation middleware is attached
- [ ] Review payment processing endpoints for SQL injection, XSS, and race conditions (e.g., duplicate order prevention with unique constraints)

## Tests (4 items)

- [ ] Confirm unit tests exist for core business logic (course enrollment, payment processing, certificate generation) with >80% code coverage
- [ ] Verify integration tests cover full user flows (register → browse courses → checkout → webhook confirmation → certificate)
- [ ] Check Razorpay webhook endpoint has tests for success, failure, and signature mismatch scenarios
- [ ] Validate that API responses include proper error codes (400/401/403/500) and error messages are user-safe (no stack traces exposed)

## Architecture & Code Quality (5 items)

- [ ] Confirm database schema is normalized (no redundant data); check for proper indexing on frequently queried columns (users, courses, orders)
- [ ] Verify API endpoints follow RESTful conventions (POST for create, PUT for update, DELETE for remove); no mixed patterns
- [ ] Check React components are modular and reusable; avoid prop drilling (use Context API or state management for global state)
- [ ] Ensure backend follows MVC pattern; business logic in models/services, not controllers; middleware organized logically
- [ ] Review API response pagination: verify limit/offset parameters are validated and sanitized to prevent DoS (max 100 items per page)

## Documentation (3 items)

- [ ] Confirm README.md exists with setup instructions, API endpoints list, and environment variable guide
- [ ] Verify code comments explain why (not what); complex payment logic and database queries are annotated
- [ ] Check API documentation includes request/response examples, error codes, and Razorpay webhook payload structure

## Deployment & CI (2 items)

- [ ] Validate GitHub Actions workflow is configured for auto-deploy to Vercel (frontend) and Railway (backend); includes environment variable injection
- [ ] Confirm staging/test environment uses Razorpay test keys; production uses live keys via secure environment variables; database backups are automated

---

**Total: 20 Items**

**Recommended Review Flow:**

1. Security first (non-negotiable for payment systems)
2. Tests (ensures confidence in deployments)
3. Architecture & Code Quality (long-term maintainability)
4. Documentation (knowledge transfer & onboarding)
5. Deployment & CI (production readiness)

**Pass Criteria:** All items checked ✓ before merging to `main` branch.
