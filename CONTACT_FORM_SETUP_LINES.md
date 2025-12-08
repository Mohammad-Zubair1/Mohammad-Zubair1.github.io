# 🎯 Contact Form Setup - Line-by-Line Configuration

## Find & Replace Guide

Open `index.html` and make these **exact replacements**:

---

## Update 1: EmailJS Public Key

**Line:** ~2170

**Find:**
```javascript
emailjs.init('YOUR_PUBLIC_KEY');
```

**Replace with:**
```javascript
emailjs.init('xxxxxxxxxxxxxxxx_xxxxxxxxxxxx');
```

**Where to get:**
- Go to https://www.emailjs.com/
- Dashboard → Account → Copy "Public Key" (looks like: `abc123_def456`)

**Example:**
```javascript
emailjs.init('y8k9p0q1r2s3_t4u5v6w7x8y9z0');
```

---

## Update 2: EmailJS Service ID

**Line:** ~2315

**Find:**
```javascript
await emailjs.send(
    'YOUR_SERVICE_ID',
```

**Replace with:**
```javascript
await emailjs.send(
    'service_abc123def456',
```

**Where to get:**
- Go to https://www.emailjs.com/
- Dashboard → Email Services → Select your service
- Copy "Service ID" (looks like: `service_xxxxx`)

**Example:**
```javascript
await emailjs.send(
    'service_j8k9p0q1r2s3t4u5',
```

---

## Update 3: EmailJS Template ID

**Line:** ~2316

**Find:**
```javascript
    'YOUR_TEMPLATE_ID',
```

**Replace with:**
```javascript
    'template_abc123def456',
```

**Where to get:**
- Go to https://www.emailjs.com/
- Dashboard → Email Templates → Select your template
- Copy "Template ID" (looks like: `template_xxxxx`)

**Example:**
```javascript
    'template_m9n0o1p2q3r4s5t6',
```

---

## Update 4: reCAPTCHA Site Key (OPTIONAL)

**Line:** ~1995

**Find:**
```html
<div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
```

**Replace with:**
```html
<div class="g-recaptcha" data-sitekey="your_site_key_here"></div>
```

**Where to get:**
- Go to https://www.google.com/recaptcha/admin
- Create new reCAPTCHA v3 project
- Copy "Site Key" (long alphanumeric string)

**Example:**
```html
<div class="g-recaptcha" data-sitekey="6LcZVRqyHh71UMIEGNQ_MXjiZKhI8k9p0q1r2s3"></div>
```

---

## ✅ Verification Checklist

After making replacements:

- [ ] Line 2170: Has your EmailJS Public Key (20-30 chars)
- [ ] Line 2315: Has your EmailJS Service ID (starts with `service_`)
- [ ] Line 2316: Has your EmailJS Template ID (starts with `template_`)
- [ ] Line 1995: (Optional) Has your reCAPTCHA Site Key (60+ chars)
- [ ] No lines say `YOUR_PUBLIC_KEY`, `YOUR_SERVICE_ID`, `YOUR_TEMPLATE_ID`
- [ ] No syntax errors (no missing quotes, parentheses)

---

## 🔍 How to Find These Lines

### Method 1: Use Find & Replace (Ctrl+H)
1. Open `index.html` in VS Code
2. Press `Ctrl+H` (or `Cmd+Shift+H` on Mac)
3. Search for: `YOUR_PUBLIC_KEY`
4. Click the one match
5. Replace with your actual key
6. Repeat for other credentials

### Method 2: Navigate Directly
1. Open `index.html`
2. Press `Ctrl+G` (Go to Line)
3. Enter line number (e.g., 2170)
4. Make replacement

### Method 3: Search by Context
1. Press `Ctrl+F` (Find)
2. Search for: `emailjs.init(`
3. You'll find the line to update

---

## 📋 Quick Copy-Paste Template

Once you have your credentials, fill in this template:

```
==== COPY YOUR CREDENTIALS BELOW ====

Public Key: ___________________________
Service ID: ___________________________
Template ID: __________________________
Site Key (optional): ___________________________

==== THEN UPDATE IN index.html ====

Line 2170: emailjs.init('[Public Key]');

Line 2315-2316:
await emailjs.send(
    '[Service ID]',
    '[Template ID]',
```

---

## 🔐 Security Reminder

```
✅ SAFE TO SHARE:
   - Public Key
   - Site Key
   - Template ID
   - Service ID

❌ NEVER SHARE:
   - EmailJS Secret Key
   - reCAPTCHA Secret Key
```

---

## 🧪 Test Form Submit

After configuration:

1. Open your portfolio in browser
2. Scroll to Contact section
3. Fill all fields:
   - Name: "Test User"
   - Email: "your@email.com"
   - Message: "This is a test message from my portfolio."
4. Check reCAPTCHA
5. Click "Send Message"
6. Watch for:
   - ✓ Loading spinner appears
   - ✓ Button becomes disabled
   - ✓ Success toast appears
   - ✓ Email arrives in your inbox
   - ✓ Form resets

---

## 🛠️ Troubleshooting

### "EmailJS is not defined"
- Email was NOT sent from `<head>` before your script runs
- Check that this line exists before the form script:
```html
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/index.min.js"></script>
```

### "Response is not defined" or 404 error
- Service ID or Template ID is wrong
- Copy EXACTLY from EmailJS dashboard
- No extra spaces or characters

### Form submits but no email
1. Check EmailJS Service is connected to your email
2. Check email address is verified in EmailJS
3. Check browser console for errors (F12 → Console)
4. Check spam/trash folder
5. Wait 30 seconds (API may be processing)

### reCAPTCHA not showing
1. Site Key might be wrong
2. Check your domain is listed in reCAPTCHA settings
3. Clear browser cache
4. Try private/incognito window

---

## 📞 Contact Support

**EmailJS Issues:**
- Documentation: https://www.emailjs.com/docs/
- Support: support@emailjs.com

**reCAPTCHA Issues:**
- Documentation: https://developers.google.com/recaptcha/docs/v3
- Support: https://support.google.com

**Your Portfolio Issues:**
- Check browser console (F12) for JavaScript errors
- Verify all 3 replacements were made correctly
- Test each field independently

---

## ✨ Final Checklist

Before considering setup complete:

- [ ] EmailJS account created
- [ ] Email service connected
- [ ] Email template created
- [ ] Public Key added (line 2170)
- [ ] Service ID added (line 2315)
- [ ] Template ID added (line 2316)
- [ ] (Optional) reCAPTCHA project created
- [ ] (Optional) Site Key added (line 1995)
- [ ] Test form works
- [ ] Email received in inbox
- [ ] Success toast appeared
- [ ] Form reset after submit

✅ **All done! You're ready to receive messages!**

---

## 🚀 Next Steps

1. ✅ Set up EmailJS and reCAPTCHA
2. ✅ Update the 3-4 lines in index.html
3. ✅ Test locally
4. ✅ Push to GitHub: `git push`
5. ✅ Your live portfolio receives messages!

**Time to completion:** ~10 minutes  
**Cost:** FREE (with optional paid upgrades later)

---

**Need help?** Check `CONTACT_FORM_SETUP.md` for detailed instructions!
