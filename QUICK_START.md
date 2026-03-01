# Quick Start Guide

## 5-Minute Setup

### Step 1: Install Dependencies
```bash
cd playwright-eaapp-tests
npm install
```

### Step 2: Run the Test
```bash
npm test
```

### Step 3: View Results
```bash
npm run test:report
```

## What the Test Does

✅ Logs into EAApp with admin credentials  
✅ Creates employee "Akshaya1" with:
  - Salary: ₹25,000/month (3 lakhs annually)
  - Duration: 24 years
  - Grade: Middle
  - Email: test1@gmail.com
✅ Validates successful creation  
✅ Logs out

**Test execution time**: ~15-20 seconds

## Common Commands

```bash
# Run all tests (all browsers)
npm test

# See browser while testing
npm run test:headed

# Interactive debugging
npm run test:ui

# Debug mode (step through)
npm run test:debug

# Run on specific browser
npm run test:chromium
npm run test:firefox
npm run test:webkit

# View HTML report
npm run test:report
```

## Test Data

| Field | Value |
|-------|-------|
| Username | admin |
| Password | password |
| Employee Name | Akshaya1 |
| Salary | ₹25,000/month |
| Duration | 24 years (288 months) |
| Grade | Middle |
| Email | test1@gmail.com |

## Need Help?

- Full docs: See `README.md`
- Playwright docs: https://playwright.dev
- Test code: See `eaemployee1.spec.ts`

---

✅ **Ready to Run - No Additional Setup Required!**
