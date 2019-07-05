# elm startfighter

Start Elm with no module bundler.


## Installation

```
$ git clone https://github.com/y047aka/elm-starfighter.git
$ cd elm-startfighter
$ npm install
$ npm start
```


## Build

```
$ npm run build
// output "./docs" directory
```


## npm scripts

package.json has some scripts:

- `clean`
- `watch`
- `compile`
- `minify:elm`
- `build`
- `start`

You can customize those scripts.

### clean

Remove `docs` directory.

```
"clean": "rimraf ./docs",
```

### watch

Run every `watch:*` at the same time.

```
"watch:html": "cpx ./src/index.html ./docs -w",
"watch:assets": "cpx \"./src/assets/**/*\" ./docs/assets -w",
"watch:js": "cpx ./src/main.js ./docs -w",
"watch:elm": "elm-live ./src/Main.elm --open --start-page=index.html --dir=./docs -- --output=./docs/elm.js",
"watch:sass": "node-sass ./src/style.scss ./docs/style.css && node-sass ./src/style.scss ./docs/style.css -w -q",
"watch": "npm-run-all -p watch:*",
```

### compile

Run every `compile:*` at the same time.

```
"compile:html": "cpx ./src/index.html ./docs",
"compile:assets": "cpx \"./src/assets/**/*\" ./docs/assets",
"compile:js": "cpx ./src/main.js ./docs",
"compile:elm": "elm make ./src/Main.elm --optimize --output=./docs/elm.optimized.js",
"compile:sass": "node-sass ./src/style.scss ./docs/style.css --output-style compressed",
"compile": "npm-run-all -p compile:*",
```

### minify:elm

Minify elm.optimized.js to elm.js

```
"minify:elm": "google-closure-compiler --js=./docs/elm.optimized.js --js_output_file=./docs/elm.js && rm ./docs/elm.optimized.js",
```

### build

Run `clean`, `compile` and `minify:elm` sequentially.

```
"build": "npm-run-all -s clean compile minify:elm",
```

### start

Run `clean` and `watch` sequentially.

```
"start": "npm-run-all -s clean watch"
```

## Cross platform
`cpx`, `npm-run-all` and `rimraf` works on Windows as well.