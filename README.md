# elm startfighter

Start Elm with no module bundler.


## Installation

```
$ git clone https://github.com/y047aka/elm-starfighter.git
$ cd elm-startfighter
$ npm install
$ npm start
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

#### Cross platform
`cpx`, `npm-run-all` and `rimraf` works on Windows as well.


## npm start

Run `clean` and `watch` sequentially.

```
"start": "npm-run-all -s clean watch"
```

The name of output directory is "docs".

### clean

Remove `docs` and `public` directory.

```
"clean": "rimraf docs public"
```

### watch

Run every `watch:*` at the same time.

```
"watch:html": "cpx -w src/index.html docs",
"watch:assets": "cpx -w \"src/assets/**/*\" docs/assets",
"watch:js": "cpx -w src/main.js docs",
"watch:elm": "elm-live src/Main.elm --open --start-page=index.html --dir=docs -- --output=docs/elm.js",
"watch:sass": "sass --watch src:docs",
"watch": "sass src:docs && npm-run-all -p watch:*"
```


## npm run build

Run `clean`, `compile` and `minify:elm` sequentially.

```
"build": "npm-run-all -s clean compile minify:elm"
```

The name of output directory is "public".

### compile

Run every `compile:*` at the same time.

```
"compile:html": "cpx src/index.html public",
"compile:assets": "cpx \"src/assets/**/*\" public/assets",
"compile:js": "cpx src/main.js public",
"compile:elm": "elm make src/Main.elm --optimize --output=public/elm.optimized.js",
"compile:sass": "sass --style=compressed --no-source-map src:public"
"compile": "npm-run-all -p compile:*"
```

### minify:elm

Minify elm.optimized.js to elm.js

```
"minify:elm": "google-closure-compiler --js=public/elm.optimized.js --js_output_file=public/elm.js && rimraf public/elm.optimized.js"
```
