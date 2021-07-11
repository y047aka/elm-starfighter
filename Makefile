
.PHONY: all
all:
	npm install

.PHONY: clean
clean:
	npx rimraf docs public

.PHONY: compile
compile:
	npx cpx src/index.html public
	npx cpx \"static/**/*\" public/static
	npx cpx src/main.js public
	npx sass --style=compressed --no-source-map src:public
	npx elm make src/Main.elm --optimize --output=public/elm.optimized.js

	npx google-closure-compiler --js=public/elm.optimized.js --js_output_file=public/elm.js
	npx rimraf public/elm.optimized.js

.PHONY: watch
watch:
	npx sass src:docs
	npx npm-run-all -p watch:*

.PHONY: start
start: clean watch

.PHONY: build
build: clean compile
