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
`copy`, `watch`, `compile`, `build` and `start`.

You can customize those scripts.

#### Cross platform
`npm-run-all` and `ncp` works on Windows as well.


### copy

Run every `copy:*` at the same time.

```
"copy:html": "ncp ./src/index.html ./docs/index.html",
"copy:js": "ncp ./src/main.js ./docs/main.js",
"copy:images": "ncp ./src/images ./docs/images",
"copy": "mkdirp docs && npm-run-all -p copy:*",
```

### watch

Run every `watch:*` at the same time.

```
"watch:elm": "elm-live ./src/elm/Main.elm --open --start-page=index.html --dir=docs -- --output=./docs/elm.js",
"watch:sass": "npm run compile:sass && node-sass ./src/style.scss ./docs/style.css -w -q",
"watch": "npm-run-all -p watch:*",
```

### compile

Run every `compile:*` at the same time.

```
"compile:elm": "elm make src/elm/Main.elm --output=./docs/elm.js",
"compile:sass": "node-sass ./src/style.scss ./docs/style.css --output-style compressed",
"compile": "npm-run-all -p compile:*",
```

### build

Run `echo`, `copy` and `compile` sequentially.

```
"build": "npm-run-all -s copy compile",
```

### start

Run `echo`, `copy` and `watch` sequentially.

```
"start": "npm-run-all -s copy watch"
```