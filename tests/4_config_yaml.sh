#!/bin/sh
. tests/functions.sh

echo "Test: YAML configuration"
setup
install

cat > .py-husky.yml << 'EOF'
hooks:
  pre-commit:
    enabled: true
    commands:
      - echo "Running from YAML config"
      - exit 0
EOF

touch test.txt
git add test.txt
expect 0 "git commit -m 'test yaml config'"

cat > .py-husky.yml << 'EOF'
hooks:
  pre-commit:
    enabled: false
    commands:
      - exit 1
EOF

touch test2.txt
git add test2.txt
expect 0 "git commit -m 'disabled hook should not run'"

echo "✓ All YAML configuration tests passed"
