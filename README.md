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
- `copy`
- `watch`
- `compile`
- `minify:elm`
- `build`
- `start`

You can customize those scripts.

### clean

Remove and make `docs` directory.

```
"clean": "rimraf ./docs && mkdirp docs",
```

### copy

Run every `copy:*` at the same time.

```
"copy:html": "ncp ./src/index.html ./docs/index.html",
"copy:js": "ncp ./src/main.js ./docs/main.js",
"copy:assets": "ncp ./src/assets ./docs/assets",
"copy": "npm-run-all -p copy:*",
```

### watch

Run every `watch:*` at the same time.

```
"watch:elm": "elm-live ./src/Main.elm --open --start-page=index.html --dir=docs -- --output=./docs/elm.js",
"watch:sass": "node-sass ./src/style.scss ./docs/style.css && node-sass ./src/style.scss ./docs/style.css -w -q",
"watch": "npm-run-all -p watch:*",
```

### compile

Run every `compile:*` at the same time.

```
"compile:elm": "elm make ./src/Main.elm --optimize --output=./docs/elm.js",
"compile:sass": "node-sass ./src/style.scss ./docs/style.css --output-style compressed",
"compile": "npm-run-all -p compile:*",
```

### minify:elm

Minify elm.js

```
"minify:elm": "google-closure-compiler --js=./docs/elm.js --js_output_file=./docs/elm.closure.min.js && ncp ./docs/elm.closure.min.js ./docs/elm.js && rm ./docs/elm.closure.min.js",
```

### build

Run `clean`, `copy`, `compile` and `minify:elm` sequentially.

```
"build": "npm-run-all -s clean copy compile minify:elm",
```

### start

Run `clean`, `copy` and `watch` sequentially.

```
"start": "npm-run-all -s clean copy watch"
```

## Cross platform
`ncp`, `npm-run-all` and `rimraf` works on Windows as well.