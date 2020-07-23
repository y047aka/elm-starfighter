# Clean
rm -rf docs public

# Pre-Watch
npx sass src:docs

# Watch
npx cpx -w src/index.html docs &
npx cpx -w \"src/assets/**/*\" docs/assets &
npx cpx -w src/main.js docs &
npx sass --watch src:docs &
npx elm-live src/Main.elm --open --start-page=index.html --dir=docs -- --output=docs/elm.js
