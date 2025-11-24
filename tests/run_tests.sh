#!/bin/sh

echo "================================"
echo "Running py-husky test suite"
echo "================================"
echo ""

TESTS_DIR="tests"
FAILED=0
PASSED=0

for test_file in "$TESTS_DIR"/[0-9]_*.sh; do
    if [ -f "$test_file" ]; then
        echo "Running: $(basename "$test_file")"
        echo "--------------------------------"
        
        if sh "$test_file"; then
            PASSED=$((PASSED + 1))
            echo ""
        else
            FAILED=$((FAILED + 1))
            echo "FAILED: $(basename "$test_file")"
            echo ""
        fi
    fi
done

echo "================================"
echo "Test Results"
echo "================================"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Total:  $((PASSED + FAILED))"
echo ""

if [ "$FAILED" -eq 0 ]; then
    echo "✓ All tests passed!"
    exit 0
else
    echo "✗ Some tests failed"
    exit 1
fi
