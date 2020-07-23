# Clean
rm -rf docs public

# Build
mkdir public
cp src/index.html public
cp src/main.js public
cp -r src/assets public

npx sass --style=compressed --no-source-map src:public
elm make src/Main.elm --optimize --output=public/elm.optimized.js

# Minify
npx google-closure-compiler --js=public/elm.optimized.js --js_output_file=public/elm.js
rm -f public/elm.optimized.js
