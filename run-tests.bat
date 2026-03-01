@echo off
REM Playwright Test Runner Helper Script for Windows
REM Usage: run-tests.bat [command] [options]

setlocal enabledelayedexpansion

if "%1"=="" (
  echo Playwright Test Helper
  echo.
  echo Usage: run-tests.bat [command] [options]
  echo.
  echo Commands:
  echo   run               Run all tests on all browsers
  echo   ui                Run tests in interactive UI mode
  echo   debug             Run tests in debug mode
  echo   headed            Run tests with visible browser
  echo   report            View HTML test report
  echo   install           Install Playwright browsers
  echo   clean             Clean test artifacts
  echo.
  echo Options:
  echo   --chromium        Run only on Chrome/Edge
  echo   --firefox         Run only on Firefox
  echo   --webkit          Run only on Safari
  echo.
  echo Examples:
  echo   run-tests.bat run
  echo   run-tests.bat run --chromium
  echo   run-tests.bat ui
  echo   run-tests.bat headed
  goto :eof
)

if "%1"=="run" (
  if "%2"=="" (
    echo Running tests on all browsers...
    call npm test
  ) else if "%2"=="--chromium" (
    echo Running tests on Chromium only...
    call npm run test:chromium
  ) else if "%2"=="--firefox" (
    echo Running tests on Firefox only...
    call npm run test:firefox
  ) else if "%2"=="--webkit" (
    echo Running tests on WebKit only...
    call npm run test:webkit
  )
  goto :eof
)

if "%1"=="ui" (
  echo Running tests in UI mode...
  call npm run test:ui
  goto :eof
)

if "%1"=="debug" (
  echo Running tests in debug mode...
  call npm run test:debug
  goto :eof
)

if "%1"=="headed" (
  echo Running tests with visible browser...
  call npm run test:headed
  goto :eof
)

if "%1"=="report" (
  echo Viewing HTML test report...
  call npm run test:report
  goto :eof
)

if "%1"=="install" (
  echo Installing Playwright browsers...
  call npx playwright install
  goto :eof
)

if "%1"=="clean" (
  echo Cleaning test artifacts...
  if exist "playwright-report" rmdir /s /q playwright-report
  if exist "test-results" rmdir /s /q test-results
  echo Cleanup complete!
  goto :eof
)

echo Unknown command: %1
echo Run 'run-tests.bat' for help
