#!/bin/sh

setup() {
    TEST_DIR=$(mktemp -d)
    cd "$TEST_DIR" || exit 1
    git init --quiet
    git config user.email "test@example.com"
    git config user.name "Test User"
}

cleanup() {
    if [ -n "$TEST_DIR" ] && [ -d "$TEST_DIR" ]; then
        cd /
        rm -rf "$TEST_DIR"
    fi
}

install() {
    python -m py_husky.cli init
}

expect() {
    expected_code=$1
    shift
    command="$*"
    
    eval "$command"
    actual_code=$?
    
    if [ "$actual_code" -eq "$expected_code" ]; then
        echo "✓ PASS: $command (exit code: $actual_code)"
        return 0
    else
        echo "✗ FAIL: $command"
        echo "  Expected exit code: $expected_code"
        echo "  Actual exit code: $actual_code"
        return 1
    fi
}

expect_file_exists() {
    file=$1
    if [ -f "$file" ]; then
        echo "✓ PASS: File exists: $file"
        return 0
    else
        echo "✗ FAIL: File does not exist: $file"
        return 1
    fi
}

expect_file_not_exists() {
    file=$1
    if [ ! -f "$file" ]; then
        echo "✓ PASS: File does not exist: $file"
        return 0
    else
        echo "✗ FAIL: File exists: $file"
        return 1
    fi
}

expect_dir_exists() {
    dir=$1
    if [ -d "$dir" ]; then
        echo "✓ PASS: Directory exists: $dir"
        return 0
    else
        echo "✗ FAIL: Directory does not exist: $dir"
        return 1
    fi
}

expect_dir_not_exists() {
    dir=$1
    if [ ! -d "$dir" ]; then
        echo "✓ PASS: Directory does not exist: $dir"
        return 0
    else
        echo "✗ FAIL: Directory exists: $dir"
        return 1
    fi
}

expect_contains() {
    file=$1
    pattern=$2
    if grep -q "$pattern" "$file"; then
        echo "✓ PASS: File contains pattern: $pattern"
        return 0
    else
        echo "✗ FAIL: File does not contain pattern: $pattern"
        return 1
    fi
}

trap cleanup EXIT
