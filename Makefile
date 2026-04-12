SCADS := $(wildcard *.scad)
PNGS  := $(SCADS:.scad=.png)

.PHONY: all clean

all: $(PNGS)

%.png: %.scad
	openscad -o $@ $<

show: 
	xdg-open $(PNGS)

clean:
	rm -f $(PNGS)
