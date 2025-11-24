#!/bin/sh
. tests/functions.sh

echo "Test: Error handling - not a git directory"
TEST_DIR=$(mktemp -d)
cd "$TEST_DIR" || exit 1

expect 1 "python -m py_husky.cli init"
expect_dir_not_exists ".py-husky"
expect_file_not_exists ".py-husky.yml"

cd /
rm -rf "$TEST_DIR"

echo "✓ All error handling tests passed"
