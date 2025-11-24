#!/usr/bin/env python3
"""
Example commit message validator for py-husky

This script validates commit messages follow conventional commit format.
Place this in your project and reference it in .py-husky.yml:

hooks:
  commit-msg:
    enabled: true
    commands:
      - python examples/commit_msg_validator.py
"""

import sys
import re


def validate_commit_message(commit_msg_file):
    """Validate commit message follows conventional commit format"""

    with open(commit_msg_file, 'r', encoding='utf-8') as f:
        commit_msg = f.read().strip()

    if not commit_msg:
        print("❌ Commit message is empty!")
        return False

    pattern = r'^(feat|fix|docs|style|refactor|test|chore|perf|ci|build|revert)(\(.+\))?: .{1,72}'

    if not re.match(pattern, commit_msg):
        print("❌ Invalid commit message format!")
        print("\nCommit message must follow conventional commit format:")
        print("  <type>(optional scope): <description>")
        print("\nValid types:")
        print("  feat:     A new feature")
        print("  fix:      A bug fix")
        print("  docs:     Documentation changes")
        print("  style:    Code style changes (formatting, etc)")
        print("  refactor: Code refactoring")
        print("  test:     Adding or updating tests")
        print("  chore:    Maintenance tasks")
        print("  perf:     Performance improvements")
        print("  ci:       CI/CD changes")
        print("  build:    Build system changes")
        print("  revert:   Revert a previous commit")
        print("\nExamples:")
        print("  feat(auth): add login functionality")
        print("  fix: resolve memory leak in data processor")
        print("  docs: update installation instructions")
        print(f"\nYour message: {commit_msg[:100]}")
        return False

    if len(commit_msg.split('\n')[0]) > 72:
        print("⚠️  Warning: First line is longer than 72 characters")
        print("   Consider making it more concise")

    print("✅ Commit message is valid")
    return True


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python commit_msg_validator.py <commit-msg-file>")
        sys.exit(1)

    commit_msg_file = sys.argv[1]

    if validate_commit_message(commit_msg_file):
        sys.exit(0)
    else:
        sys.exit(1)
