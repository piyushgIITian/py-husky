"""
Basic example of using py-husky in a Python project

This example shows how to set up py-husky with common Python tools.

After installing py-husky, run:
    py-husky init

This will create:
    1. .py-husky/ directory
    2. .py-husky.yml configuration file
    3. Git hooks in .git/hooks/

Example .py-husky.yml configuration:
    hooks:
      pre-commit:
        enabled: true
        commands:
          - echo "Running pre-commit checks..."
          - black --check .
          - flake8 .
          - isort --check-only .

      pre-push:
        enabled: true
        commands:
          - echo "Running tests before push..."
          - pytest tests/ -v
          - pytest tests/ --cov

      commit-msg:
        enabled: false
        commands:
          - python scripts/validate_commit_msg.py

You can also add hooks via CLI:
    py-husky add pre-commit "black ." "flake8"
    py-husky add pre-push "pytest tests/"

List all configured hooks:
    py-husky list-hooks

After cloning a repository with py-husky:
    py-husky install
"""

print("See README.md for complete documentation")
