# py-husky Test Suite

Shell-based integration tests for py-husky, inspired by Husky's testing approach.

## Running Tests

Run all tests:
```bash
sh tests/run_tests.sh
```

Run individual test:
```bash
sh tests/1_init.sh
```

## Test Files

- `functions.sh` - Helper functions for testing
- `1_init.sh` - Test initialization
- `2_add_hook.sh` - Test adding hooks via CLI
- `3_hook_execution.sh` - Test hook execution
- `4_config_yaml.sh` - Test YAML configuration
- `5_not_git_dir.sh` - Test error handling
- `6_uninstall.sh` - Test uninstalling hooks
- `run_tests.sh` - Test runner script

## Test Structure

Each test follows this pattern:

```sh
#!/bin/sh
. tests/functions.sh

echo "Test: Description"
setup
install

# Test assertions
expect 0 "command"
expect_file_exists "file"
expect_contains "file" "pattern"

echo "✓ All tests passed"
```

## Helper Functions

- `setup()` - Create temporary git repository
- `cleanup()` - Clean up test directory
- `install()` - Initialize py-husky
- `expect(code, command)` - Assert command exit code
- `expect_file_exists(file)` - Assert file exists
- `expect_file_not_exists(file)` - Assert file doesn't exist
- `expect_dir_exists(dir)` - Assert directory exists
- `expect_contains(file, pattern)` - Assert file contains pattern

## Requirements

- Python 3.8+
- Git
- Shell (sh/bash)
- py-husky installed in development mode

## Notes

- Tests run in isolated temporary directories
- Each test cleans up after itself
- Tests are numbered for execution order
- Exit codes: 0 = success, 1 = failure
