# ⚡ Contact Form - Quick Setup Checklist

## 3-Step Setup (Takes ~5 minutes)

### Step 1: EmailJS Setup
- [ ] Go to https://www.emailjs.com/ and sign up (free)
- [ ] Create Email Service (connect your Gmail/email)
- [ ] Create Email Template with these variables:
  - `{{from_name}}`
  - `{{from_email}}`
  - `{{message}}`
  - `{{reply_to}}`
- [ ] Copy **Public Key**, **Service ID**, **Template ID**

### Step 2: Update index.html
Find and replace these THREE lines:

**Line ~2170:**
```javascript
emailjs.init('YOUR_PUBLIC_KEY');
```
Replace `YOUR_PUBLIC_KEY` → Your EmailJS Public Key

**Line ~2295 (2 replacements):**
```javascript
await emailjs.send(
    'YOUR_SERVICE_ID',    // Replace this
    'YOUR_TEMPLATE_ID',   // Replace this
```

### Step 3: (Optional) reCAPTCHA Setup
- [ ] Go to https://www.google.com/recaptcha/admin
- [ ] Create reCAPTCHA v3 project
- [ ] Copy **Site Key**
- [ ] Find line ~1965 in `index.html` and replace:
```html
<div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>
```

---

## Where to Find Your Credentials

### EmailJS Dashboard
```
Dashboard → Account → Public Key
Dashboard → Email Services → Your Service → Service ID
Dashboard → Email Templates → Your Template → Template ID
```

### Google reCAPTCHA Admin
```
https://www.google.com/recaptcha/admin
Select your project → Site Key (under Keys section)
```

---

## Form Features

✅ Real-time validation (name, email, message)  
✅ Character counter (max 500)  
✅ Loading spinner on submit  
✅ Toast notifications (success/error)  
✅ Error messages below each field  
✅ Focus animations  
✅ reCAPTCHA spam protection  
✅ Fully responsive  
✅ Accessibility compliant  

---

## Testing

1. Fill form correctly
2. Check reCAPTCHA
3. Click "Send Message"
4. Check your email
5. Should see success toast

---

## Common Issues

| Problem | Solution |
|---------|----------|
| "EmailJS is not defined" | Make sure CDN script loaded (already in HTML) |
| No email received | Check Service is connected, Template ID correct |
| reCAPTCHA not showing | Verify Site Key is correct |

---

## Files Modified

- `index.html` - Contact form HTML + JavaScript + CSS + CDN scripts

---

## Form Specifications

**Email Service:** EmailJS (free tier: 200 emails/month)  
**Spam Protection:** Google reCAPTCHA v3  
**Validation:** Client-side + Server-side ready  
**Notifications:** Toast messages  
**Max Message:** 500 characters  
**Min Message:** 10 characters  

---

**Setup Time:** ~5 minutes  
**Monthly Cost:** Free (with optional paid upgrades)  
**Difficulty:** Easy  

🚀 **Ready to go live!**
