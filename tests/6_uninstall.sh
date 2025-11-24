#!/bin/sh
. tests/functions.sh

echo "Test: Uninstall hooks"
setup
install

expect_file_exists ".git/hooks/pre-commit"
expect_file_exists ".git/hooks/pre-push"

echo "y" | python -m py_husky.cli uninstall

expect_file_not_exists ".git/hooks/pre-commit"
expect_file_not_exists ".git/hooks/pre-push"

echo "✓ All uninstall tests passed"
