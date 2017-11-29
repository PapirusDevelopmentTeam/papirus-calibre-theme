ZOOM_FACTOR := 1

all:

build: convert

clean:
	find ./resources/images -type f -name '*.png' -delete
	find ./resources/images -empty -delete

convert:
	ZOOM_FACTOR=$(ZOOM_FACTOR) sh imgsrc/_convert-to-png.sh

svgo:
	svgo --config=imgsrc/_svgo.yml -f imgsrc

install:
	mkdir -p "$(HOME)/.config/calibre/resources/images"
	cp -R resources/images "$(HOME)/.config/calibre/resources"

uninstall:
	rm -rf "$(HOME)/.config/calibre/resources/images"


.PHONY: all build clean convert install uninstall
