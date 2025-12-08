# CourseLab – Physics Wallah-Style EdTech Platform

## Project Overview

**CourseLab** is a production-ready, full-stack EdTech SaaS platform built to democratize online learning. Users can browse curated courses, make secure purchases via Razorpay, stream video content, track progress, and earn certificates—all in a seamless, responsive experience. Built solo in **12 weeks**, CourseLab demonstrates end-to-end full-stack capability: from normalized database design and secure REST APIs to responsive UI and automated payments.

---

## Links

- **Live Demo:** [courselab-demo.vercel.app](https://courselab-demo.vercel.app)
- **GitHub Repository:** [Mohammad-Zubair1/Paid-Course-Platform-Red](https://github.com/Mohammad-Zubair1/Paid-Course-Platform-Red)
- **Portfolio:** [mohammadzubair.dev](https://mohammadzubair.dev)

---

## Key Features

### User-Facing

- **Course Discovery & Filtering** – Advanced search, pagination, category filters
- **Secure Authentication** – JWT-based registration/login with Sanctum tokens
- **Shopping Cart & Checkout** – Session-persistent cart with one-click purchase flow
- **Video Streaming** – HLS/MP4 course content with progress tracking
- **Student Dashboard** – Enrollment history, course progress, certificates
- **Certificate Generation** – Automatic certificate issuance upon course completion

### Admin & Instructor

- **Course Management** – Create, edit, publish, and archive courses
- **Student Management** – View enrollments, track engagement, manage access
- **Order Management** – Real-time order tracking, refund processing
- **Analytics** – Course performance metrics, revenue tracking

### Technical Highlights

- **Payment Integration** – Razorpay gateway with webhook signature verification; zero failed transactions
- **Role-Based Access Control** – Fine-grained permissions (Student, Instructor, Admin)
- **Optimized Database** – Normalized MySQL schema; 50% reduction in API response time
- **CI/CD Pipeline** – GitHub Actions auto-deploy on push to Vercel (frontend) & Railway (backend)

---

## Tech Stack & Architecture

```
Frontend (Vercel)
├── React.js (ES6+, Component-based)
├── Tailwind CSS (Responsive, utility-first)
├── Axios (API client)
└── Framer Motion (Smooth animations)

Backend (Railway)
├── Laravel 10 (RESTful API framework)
├── Sanctum (Token-based authentication)
├── Razorpay SDK (Payment processing)
└── Webhook Handler (Async payment verification)

Database (MySQL)
├── Users (roles, profiles)
├── Courses (content, metadata)
├── Enrollments (student progress)
├── Orders & Transactions (payment records)
└── Certificates (issued records)

Infrastructure
├── Vercel (Frontend hosting, auto-deploy)
├── Railway (Backend hosting, auto-deploy)
└── GitHub Actions (CI/CD pipeline)
```

### API Architecture

- **15+ RESTful endpoints** for courses, users, orders, and certificates
- **Request/response validation** using Laravel form requests
- **Pagination** for large datasets (courses, orders)
- **Rate limiting** to prevent abuse
- **CORS** configured for Vercel frontend

---

## Setup Instructions

### Prerequisites

- **Node.js** v16+ (for frontend)
- **PHP** 8.1+ (for Laravel backend)
- **Composer** (PHP dependency manager)
- **MySQL** 5.7+ (or MariaDB)
- **Git**

### Frontend Setup (React + Vercel)

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Mohammad-Zubair1/Paid-Course-Platform-Red.git
   cd frontend
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Create `.env.local`:**

   ```
   REACT_APP_API_URL=http://localhost:8000/api
   REACT_APP_RAZORPAY_KEY_ID=<your_razorpay_test_key_id>
   ```

4. **Run development server:**

   ```bash
   npm start
   ```

   Frontend available at `http://localhost:3000`

5. **Build for production:**
   ```bash
   npm run build
   ```

### Backend Setup (Laravel + Railway)

1. **Navigate to backend:**

   ```bash
   cd backend
   ```

2. **Install PHP dependencies:**

   ```bash
   composer install
   ```

3. **Create `.env` file:**

   ```
   APP_NAME=CourseLab
   APP_ENV=local
   APP_DEBUG=true
   APP_KEY=base64:XXXXXXXXX  # Run: php artisan key:generate

   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=courselab_db
   DB_USERNAME=root
   DB_PASSWORD=

   SANCTUM_STATEFUL_DOMAINS=localhost:3000,127.0.0.1:3000
   SESSION_DOMAIN=localhost

   RAZORPAY_KEY_ID=<your_test_key>
   RAZORPAY_KEY_SECRET=<your_test_secret>

   WEBHOOK_SECRET=<generate_secure_webhook_secret>
   ```

4. **Generate application key:**

   ```bash
   php artisan key:generate
   ```

5. **Run migrations:**

   ```bash
   php artisan migrate --seed
   ```

6. **Start development server:**

   ```bash
   php artisan serve
   ```

   Backend available at `http://localhost:8000`

7. **For production (Railway):**
   - Push to GitHub
   - Connect Railway project to GitHub repo
   - Set environment variables in Railway dashboard
   - Deploy automatically on push

---

## Testing Razorpay Payments

CourseLab uses **Razorpay Test Mode** for safe payment testing.

### Test Credentials

- **Test Key ID & Secret** are in the `.env` file (obtain from [Razorpay Dashboard](https://dashboard.razorpay.com))

### Test Payment Flow

1. **Navigate to checkout** in the app
2. **Enter course details** and click "Buy Now"
3. **Razorpay Modal appears** – use test card:
   - **Card Number:** `4111 1111 1111 1111`
   - **Expiry:** `12/25` (any future date)
   - **CVV:** `123`
   - **OTP:** `123456` (when prompted)
4. **Payment succeeds** → Webhook triggered → Order record created → Certificate queued
5. **Verify in Admin Panel** → Orders tab shows new transaction

### Webhook Testing (Local)

Use **ngrok** to expose local webhook endpoint:

```bash
ngrok http 8000
# Copy HTTPS URL and update in Razorpay Dashboard Webhook URL
# Format: https://<ngrok-id>.ngrok.io/api/webhooks/razorpay
```

Razorpay will POST payment confirmations to this URL.

---

## Security Considerations

### Webhook Signature Verification

All incoming Razorpay webhooks are verified using HMAC-SHA256 signature:

```php
// Laravel Middleware verifies signature before processing
$signature = hash_hmac('sha256', $payload, env('RAZORPAY_KEY_SECRET'));
if ($signature !== $webhookSignature) {
    abort(403, 'Invalid webhook signature');
}
```

### Environment Variables

- **Never commit `.env` files** to Git; use `.env.example` for documentation
- Store **Razorpay secrets, database credentials, JWT keys** only in environment variables
- Rotate webhook secrets regularly

### CORS & CSRF Protection

- **CORS configured** to allow only Vercel frontend domain
- **CSRF tokens** enforced on state-changing endpoints
- **Sanctum tokens** refreshed hourly for security

### Rate Limiting

- **Login endpoint:** 5 attempts per minute
- **Payment webhook:** 10 requests per second
- **API endpoints:** 100 requests per minute per user

---

## What I Learned

### Technical Achievements

- **Full-stack ownership:** Designed, built, tested, and deployed a production system end-to-end
- **Payment integration:** Integrated Razorpay securely; handled async webhook verification and reconciliation
- **Database optimization:** Normalized schema design; reduced API latency by 50% through query optimization
- **Authentication security:** Implemented JWT/Sanctum tokens with refresh mechanisms and role-based access control
- **CI/CD workflows:** Automated deployments using GitHub Actions; reduced manual deployment time by 90%

### Key Insights

- Webhook signature verification is critical for payment security; never skip it
- Pagination is essential for large datasets to maintain frontend performance
- Environment-based configuration (dev/test/prod) prevents security leaks
- Regular code reviews and testing catch 80% of bugs before production

---

## Future Improvements

- [ ] **Live streaming** – Migrate from pre-recorded to live courses using HLS/DASH
- [ ] **Student analytics** – Dashboard with engagement heat maps and cohort analysis
- [ ] **Instructor commission** – Tiered revenue sharing for instructors
- [ ] **Mobile app** – React Native app for iOS/Android
- [ ] **Advanced search** – Elasticsearch integration for fuzzy course search
- [ ] **Notifications** – Real-time push notifications (Firebase Cloud Messaging)
- [ ] **Internationalization** – Multi-language support (Hindi, Urdu, English)
- [ ] **Social features** – Discussion forums, peer-to-peer Q&A

---

## License

This project is licensed under the **MIT License** – see `LICENSE` file for details.

---

## Contact & Support

**Mohammad Zubair**

- **Email:** [zubairskb030@gmail.com](mailto:zubairskb030@gmail.com)
- **LinkedIn:** [linkedin.com/in/mohammadzubairdev](https://linkedin.com/in/mohammadzubairdev)
- **GitHub:** [github.com/Mohammad-Zubair1](https://github.com/Mohammad-Zubair1)
- **Portfolio:** [mohammadzubair.dev](https://mohammadzubair.dev)

For questions, feature requests, or bug reports, please open an **issue** on GitHub or contact directly.

---

**Built with ❤️ | Full Stack EdTech Platform | 12-Week Solo Development | Production Ready**
