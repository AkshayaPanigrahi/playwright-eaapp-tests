#!/bin/bash

# Playwright Test Runner Helper Script for Unix/Linux/macOS
# Usage: ./run-tests.sh [command] [options]

if [ -z "$1" ]; then
  echo "Playwright Test Helper"
  echo ""
  echo "Usage: ./run-tests.sh [command] [options]"
  echo ""
  echo "Commands:"
  echo "  run               Run all tests on all browsers"
  echo "  ui                Run tests in interactive UI mode"
  echo "  debug             Run tests in debug mode"
  echo "  headed            Run tests with visible browser"
  echo "  report            View HTML test report"
  echo "  install           Install Playwright browsers"
  echo "  clean             Clean test artifacts"
  echo ""
  echo "Options:"
  echo "  --chromium        Run only on Chrome/Edge"
  echo "  --firefox         Run only on Firefox"
  echo "  --webkit          Run only on Safari"
  echo ""
  echo "Examples:"
  echo "  ./run-tests.sh run"
  echo "  ./run-tests.sh run --chromium"
  echo "  ./run-tests.sh ui"
  echo "  ./run-tests.sh headed"
  exit 0
fi

case "$1" in
  run)
    if [ -z "$2" ]; then
      echo "Running tests on all browsers..."
      npm test
    elif [ "$2" = "--chromium" ]; then
      echo "Running tests on Chromium only..."
      npm run test:chromium
    elif [ "$2" = "--firefox" ]; then
      echo "Running tests on Firefox only..."
      npm run test:firefox
    elif [ "$2" = "--webkit" ]; then
      echo "Running tests on WebKit only..."
      npm run test:webkit
    fi
    ;;
  ui)
    echo "Running tests in UI mode..."
    npm run test:ui
    ;;
  debug)
    echo "Running tests in debug mode..."
    npm run test:debug
    ;;
  headed)
    echo "Running tests with visible browser..."
    npm run test:headed
    ;;
  report)
    echo "Viewing HTML test report..."
    npm run test:report
    ;;
  install)
    echo "Installing Playwright browsers..."
    npx playwright install
    ;;
  clean)
    echo "Cleaning test artifacts..."
    rm -rf playwright-report
    rm -rf test-results
    echo "Cleanup complete!"
    ;;
  *)
    echo "Unknown command: $1"
    echo "Run './run-tests.sh' for help"
    exit 1
    ;;
esac
