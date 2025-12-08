# Contact Form Setup Guide

Your portfolio now has an **enhanced production-ready contact form** with validation, real-time error messages, toast notifications, and email integration via EmailJS. Follow this guide to complete the setup.

## 🔧 Setup Requirements

### 1. **EmailJS Configuration** (Required for Email Sending)

EmailJS allows you to send emails directly from your portfolio without a backend server.

#### Step 1: Create EmailJS Account
1. Go to [https://www.emailjs.com/](https://www.emailjs.com/)
2. Sign up for a **free account**
3. Verify your email

#### Step 2: Create Email Service
1. In the Dashboard, go to **Email Services**
2. Click **Add Service**
3. Choose **Gmail** (or your email provider)
4. Follow the authentication steps to connect your email
5. Copy your **Service ID** (looks like: `service_xxxxx`)

#### Step 3: Create Email Template
1. Go to **Email Templates**
2. Click **Create New Template**
3. Use this configuration:

```
Template Name: Portfolio Contact Form
Subject: New Message from {{from_name}}

Email Content:
---
Hello,

You have received a new message from {{from_name}} ({{from_email}}):

Message:
{{message}}

---
Reply-to: {{reply_to}}
```

4. Copy your **Template ID** (looks like: `template_xxxxx`)

#### Step 4: Update index.html
Find these lines in `index.html` and replace them with your credentials:

**Line ~2170:** Replace `'YOUR_PUBLIC_KEY'` with your EmailJS Public Key
```javascript
emailjs.init('YOUR_PUBLIC_KEY');  // ← Replace THIS
```

**Line ~2295:** Replace `'YOUR_SERVICE_ID'` and `'YOUR_TEMPLATE_ID'`
```javascript
const response = await emailjs.send(
    'YOUR_SERVICE_ID',    // ← Replace THIS
    'YOUR_TEMPLATE_ID',   // ← Replace THIS
    {
        from_name: nameInput.value,
        from_email: emailInput.value,
        message: messageInput.value,
        reply_to: emailInput.value
    }
);
```

**Where to find your credentials:**
- **Public Key:** EmailJS Dashboard → Account → Public Key
- **Service ID:** Email Services → Your Service
- **Template ID:** Email Templates → Your Template

---

### 2. **reCAPTCHA v3 Configuration** (Recommended for Spam Protection)

reCAPTCHA v3 protects your form from automated spam submissions.

#### Step 1: Register with Google reCAPTCHA
1. Go to [https://www.google.com/recaptcha/admin](https://www.google.com/recaptcha/admin)
2. Click **Create** or **+**
3. Fill in:
   - **Label:** "My Portfolio"
   - **reCAPTCHA type:** Select **reCAPTCHA v3**
   - **Domains:** Add your portfolio domain (e.g., `mohammad-zubair1.github.io`)
4. Accept terms and click **Submit**

#### Step 2: Copy Site Key
After creation, you'll see:
- **Site Key** (public, safe to share)
- **Secret Key** (keep private!)

#### Step 3: Update index.html
Find this line in `index.html` (~line 1965) and replace the test key:

```html
<div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
```

Replace with your Site Key:
```html
<div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>
```

**Note:** The script tag is already included:
```html
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
```

---

## ✨ Form Features Included

### Real-time Validation
- **Name:** 2-50 characters required
- **Email:** Valid email format required
- **Message:** 10-500 characters required
- **reCAPTCHA:** Must verify before submission
- **Error Messages:** Display inline under each field

### User Experience
- ✅ Character counter (shows message length / 500)
- ✅ Loading spinner during email submission
- ✅ Success/Error toast notifications (auto-dismiss after 5s)
- ✅ Focus animations on inputs
- ✅ Form reset after successful submission
- ✅ Disabled submit button during loading

### Accessibility
- ARIA labels on all inputs
- Semantic HTML structure
- Keyboard navigation support
- Clear error messages
- Proper form validation feedback

---

## 🧪 Testing Your Form

### Step 1: Test Validation
1. Open your portfolio
2. Try submitting without filling fields → Should see error messages
3. Try entering invalid email → Should show "Please enter a valid email"
4. Try short message (< 10 chars) → Should show error
5. Skip reCAPTCHA → Should show error

### Step 2: Test Email Submission
1. Fill all fields correctly
2. Check reCAPTCHA box
3. Click "Send Message"
4. Should see loading spinner
5. Check your email for test message
6. Should see success toast notification

### Step 3: Test UI Features
- Type in message field → Character counter updates
- Click input field → Border glows emerald
- Submit form → Button shows spinner, text changes
- Message sends → Toast appears, form resets

---

## 🔒 Security Notes

### Keep Private
- ❌ Never share your EmailJS **Secret Key**
- ❌ Never share your reCAPTCHA **Secret Key**
- ✅ Your **Public Key** and **Site Key** are safe to keep in public code

### Best Practices
1. **EmailJS Public Key:** Uses authentication tokens instead of secrets
2. **reCAPTCHA v3:** Non-intrusive, no checkbox needed
3. **Client-side Validation:** Works alongside server-side validation
4. **No Backend Needed:** EmailJS handles all email delivery

---

## 📧 Email Template Variables

The form sends these variables to your email template:

| Variable | Source | Example |
|----------|--------|---------|
| `{{from_name}}` | Name input | "John Doe" |
| `{{from_email}}` | Email input | "john@example.com" |
| `{{message}}` | Message textarea | "I'd like to hire you..." |
| `{{reply_to}}` | Email input (copy) | "john@example.com" |

These match the form submission:
```javascript
{
    from_name: nameInput.value,
    from_email: emailInput.value,
    message: messageInput.value,
    reply_to: emailInput.value
}
```

---

## 🛠️ Troubleshooting

### Problem: "EmailJS is not defined"
**Solution:** Make sure the CDN script is loaded before your form handler:
```html
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/index.min.js"></script>
```

### Problem: Form submits but no email received
1. Check EmailJS Service is connected to your email
2. Check Template ID is correct
3. Check Console for error messages (F12 → Console tab)
4. Verify email address in EmailJS is verified

### Problem: reCAPTCHA not showing
1. Verify your Site Key is correct
2. Check that your domain is listed in reCAPTCHA settings
3. Clear browser cache and reload

### Problem: Toast notifications not visible
1. Check that `toastContainer` div exists in HTML
2. Verify CSS animations are enabled
3. Check browser console for JavaScript errors

---

## 📱 Mobile Optimization

The form is fully responsive:
- **Mobile:** Single column, optimized spacing
- **Tablet:** Single or dual column layout
- **Desktop:** Clean two-column layout with contact info

reCAPTCHA scales properly on all devices (0.85-0.9 scale on mobile).

---

## 🔄 Next Steps

1. ✅ Sign up for EmailJS (free tier available)
2. ✅ Create email service and template
3. ✅ Add your Public Key to `index.html`
4. ✅ (Optional) Create reCAPTCHA v3 and add Site Key
5. ✅ Test form submission
6. ✅ Deploy to GitHub Pages

---

## 📚 Resources

- **EmailJS Docs:** https://www.emailjs.com/docs/
- **reCAPTCHA Docs:** https://developers.google.com/recaptcha/docs/v3
- **Contact Form Test:** After setup, your form will be fully functional
- **GitHub Pages Deploy:** `git push` to update your live portfolio

---

## 💡 Pro Tips

1. **Custom Email Templates:** EmailJS allows HTML templates with styling
2. **Multiple Recipients:** Forward emails to multiple addresses in EmailJS settings
3. **Conditional Logic:** Can add more complex validation using JavaScript
4. **Rate Limiting:** Consider adding submission limits to prevent abuse
5. **Analytics:** Track form submissions in Google Analytics

---

## Support

For issues with:
- **EmailJS:** Check their documentation or contact support@emailjs.com
- **reCAPTCHA:** See Google's troubleshooting guide
- **Your Portfolio:** Check browser console (F12) for error messages

**Happy sending!** 🚀
