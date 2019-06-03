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

### copy

```
"copy:html": "ncp ./src/index.html ./docs",
"copy:js": "ncp ./src/main.js ./docs",
"copy:images": "ncp ./src/images ./docs/images",
"copy": "npm-run-all -p copy:*",
```

### watch

```
"watch:elm": "elm-live ./src/elm/Main.elm --open --start-page=index.html --dir=docs -- --output=./docs/elm.js",
"watch:sass": "node-sass --include-path scss ./src/style.scss ./docs/style.css --watch --quiet",
"watch": "npm-run-all -p watch:*",
```

### copy

```
"compile:elm": "elm make src/elm/Main.elm --output=./docs/elm.js",
"compile:sass": "node-sass --include-path scss ./src/style.scss ./docs/style.css",
"compile": "npm-run-all -p compile:*",
```

### build

```
"build": "npm-run-all -s echo copy compile",
```

### start

```
"start": "npm-run-all -s echo copy watch"
```