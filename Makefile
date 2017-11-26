ZOOM_FACTOR := 1

all:

build: convert

clean:
	find ./resources/images -type f -name '*.png' -delete
	find ./resources/images -empty -delete

convert:
	ZOOM_FACTOR=$(ZOOM_FACTOR) sh imgsrc/_convert-to-png.sh

install:

uninstall:


.PHONY: all build clean convert install uninstall
