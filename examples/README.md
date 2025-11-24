# py-husky Examples

This directory contains example hook files that demonstrate how to use py-husky.

## Example Hook Files

### pre-commit
Example pre-commit hook that runs code formatting and linting checks:
- Black (code formatter)
- Flake8 (style checker)
- Mypy (type checker)

### pre-push
Example pre-push hook that runs tests before pushing:
- Pytest (unit tests)
- Coverage reports

### commit_msg_validator.py
Python script for validating commit messages using conventional commit format.

### basic_example.py
Basic Python example showing how to use py-husky programmatically.

## Usage

To use these examples in your project:

1. Initialize py-husky:
   ```bash
   py-husky init
   ```

2. Copy the example hooks to your `.py-husky/` directory:
   ```bash
   cp examples/pre-commit .py-husky/
   cp examples/pre-push .py-husky/
   ```

3. Make them executable:
   ```bash
   chmod +x .py-husky/pre-commit
   chmod +x .py-husky/pre-push
   ```

4. Customize the hooks for your project needs.

## Creating Custom Hooks

All hooks are simple shell scripts. Create a file in `.py-husky/` with the hook name:

```bash
#!/bin/sh

# Your commands here
echo "Running custom hook..."
your-command

# Exit with non-zero code to prevent the git action
if [ $? -ne 0 ]; then
    echo "Hook failed!"
    exit 1
fi
```

## Available Hooks

- `pre-commit` - Runs before commit
- `pre-push` - Runs before push
- `commit-msg` - Validates commit message
- `pre-rebase` - Runs before rebase
- `post-checkout` - Runs after checkout
- `post-merge` - Runs after merge
- `prepare-commit-msg` - Prepares commit message
