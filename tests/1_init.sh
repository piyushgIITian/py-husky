#!/bin/sh
. tests/functions.sh

echo "Test: Initialize py-husky"
setup
install

expect_dir_exists ".py-husky"
expect_file_exists ".py-husky.yml"
expect_file_exists ".git/hooks/pre-commit"
expect_file_exists ".git/hooks/pre-push"
expect_file_exists ".git/hooks/commit-msg"

expect_contains ".git/hooks/pre-commit" "py-husky"
expect_contains ".py-husky.yml" "hooks:"

echo "✓ All initialization tests passed"
