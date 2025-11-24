#!/bin/sh
. tests/functions.sh

echo "Test: Hook execution"
setup
install

cat > .py-husky/pre-commit << 'EOF'
#!/bin/sh
echo "Hook executed successfully"
exit 0
EOF
chmod +x .py-husky/pre-commit

touch test.txt
git add test.txt
expect 0 "git commit -m 'test commit'"

cat > .py-husky/pre-commit << 'EOF'
#!/bin/sh
echo "Hook failed"
exit 1
EOF

touch test2.txt
git add test2.txt
expect 1 "git commit -m 'test commit 2'"

echo "✓ All hook execution tests passed"
