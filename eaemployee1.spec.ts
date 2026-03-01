import { test, expect } from '@playwright/test';

// Test: Add new employee Akshaya1 and validate success
test('Add new employee Akshaya1 and validate', async ({ page }) => {
  // 1. Open the app
  await page.goto('http://eaapp.somee.com/');

  // 2. Login with admin credentials
  await page.getByRole('link', { name: 'Login' }).click();
  await page.getByRole('textbox', { name: 'User Name' }).fill('admin');
  await page.getByRole('textbox', { name: 'Password' }).fill('password');
  await page.getByRole('button', { name: 'Sign In' }).click();

  // 3. Navigate to Employees tab
  await page.getByRole('link', { name: '👥 Employees' }).click();

  // 4. Click on New Employee
  await page.getByRole('link', { name: '+ New Employee' }).click();

  // 5. Fill employee details for Akshaya1
  // Name: Akshaya1
  // Salary: 3 lakhs (₹25,000/month)
  // Duration: 24 years (288 months)
  // Grade: Middle
  // Email: test1@gmail.com
  
  await page.getByRole('textbox', { name: 'Full Name' }).fill('Akshaya1');
  await page.getByRole('spinbutton', { name: 'Monthly Salary' }).fill('25000');
  await page.getByRole('spinbutton', { name: 'Duration Worked (months)' }).fill('288');
  
  // Select Grade as Middle
  await page.getByLabel('Grade').selectOption('2');
  
  await page.getByRole('textbox', { name: 'Email Address' }).fill('test1@gmail.com');

  // 6. Create Employee - Click button and wait for navigation
  await page.getByRole('button', { name: '✓ Create Employee' }).click();

  // 7. Wait for the page to load the employee list
  await page.waitForURL('**/Employee');
  await page.waitForLoadState('networkidle');
  
  // Validate success: Check if Akshaya1 appears in the employee list
  const akshaya1Element = page.getByText('Akshaya1', { exact: false }).first();
  await expect(akshaya1Element).toBeVisible();
  
  // Search for Akshaya1 to further validate creation
  await page.getByPlaceholder('🔍 Search by name...').fill('Akshaya1');
  await page.getByRole('button', { name: 'Search' }).click();
  await page.waitForLoadState('networkidle');
  
  // Verify search results show Akshaya1
  await expect(page.getByText('Akshaya1', { exact: false }).first()).toBeVisible();

  // 8. Log off
  await page.getByRole('button', { name: 'Logout' }).click();
  
  // Verify logout was successful by checking if we're back on the home page
  await expect(page.getByRole('link', { name: 'Login' })).toBeVisible();
});
