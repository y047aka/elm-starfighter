# Clean
rm -rf docs public

# Pre-Watch
npx sass src:docs

# Watch
npx npm-run-all -p watch:*
