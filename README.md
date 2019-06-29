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
"copy:assets": "ncp ./src/assets ./docs/assets",
"copy:js": "ncp ./src/main.js ./docs/main.js",
"copy": "npm-run-all -p copy:*",
```

### watch

Run every `watch:*` at the same time.

```
"watch:html": "chokidar ./src/*.html -c 'npm-run-all -s copy:html browser-sync' --initial",
"watch:assets": "chokidar ./src/assets -c 'npm run copy:assets' --initial",
"watch:js": "chokidar ./src/*.js -c 'npm run copy:js' --initial",
"watch:elm": "chokidar ./src/*.elm -c 'elm make ./src/Main.elm --output ./docs/elm.js' --initial",
"watch:sass": "chokidar ./src/*.scss -c 'node-sass ./src/style.scss ./docs/style.css -q' --initial",
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

Run `clean` and `watch` sequentially.

```
"start": "npm-run-all -s clean watch"
```

## Cross platform
`ncp`, `npm-run-all` and `rimraf` works on Windows as well.