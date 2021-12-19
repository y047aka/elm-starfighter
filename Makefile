.PHONY: all
all:
	npm install
	make build

.PHONY: clean
clean:
	npx rimraf docs public

.PHONY: start
start:
	make clean

	npx sass src:docs
	make -j watch_html watch_js watch_elm watch_sass

.PHONY: watch_html
watch_html:
	npx cpx -w src/index.html docs

.PHONY: watch_static
watch_static:
	npx cpx -w \"static/**/*\" docs/static

.PHONY: watch_js
watch_js:
	npx cpx -w src/main.js docs

.PHONY: watch_elm
watch_elm:
	npx elm-live src/Main.elm --dir=docs --start-page=index.html --open -- --debug --output=docs/elm.js

.PHONY: watch_sass
watch_sass:
	npx sass --watch src:docs

.PHONY: build
build:
	make clean

	npx cpx src/index.html public
	npx cpx \"static/**/*\" public/static
	npx cpx src/main.js public
	npx elm make src/Main.elm --optimize --output=public/elm.optimized.js
	npx sass --style=compressed --no-source-map src:public

	npx google-closure-compiler --js=public/elm.optimized.js --js_output_file=public/elm.js
	npx rimraf public/elm.optimized.js
