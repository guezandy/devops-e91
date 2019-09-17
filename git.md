### Working with git hooks

- in a repo: `cat > .git/hooks/pre-commit << EOF
  In the file

```
echo " ---- A commit happened ------"
EOF
```

- `chmod +x .git/hooks/pre-commit`

## Don't forget git tags
