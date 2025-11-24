#!/bin/sh
. tests/functions.sh

echo "Test: Add hooks via CLI"
setup
install

python -m py_husky.cli add pre-commit "echo 'test'" "black ."
expect_file_exists ".py-husky/pre-commit"
expect_contains ".py-husky/pre-commit" "echo 'test'"
expect_contains ".py-husky/pre-commit" "black ."

python -m py_husky.cli add pre-push "pytest tests/"
expect_file_exists ".py-husky/pre-push"
expect_contains ".py-husky/pre-push" "pytest tests/"

echo "✓ All add hook tests passed"
