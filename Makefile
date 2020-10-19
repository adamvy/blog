.ONESHELL:

HOST = georgie.vany.ca

FONTS = $(wildcard fonts/*.woff2)

all: render

.PHONY: render
render: $(FONTS_WOFF2) style.css
	emacs --batch -l render.el
	tar c $^ | tar xv -C .publish


.PHONY: deploy
deploy: render
	tar cz -C .publish --exclude=*~ . | ssh $(HOST) tar xvz -C /var/www/blog/html

.PHONY: clean
clean:
	rm -rf .publish
