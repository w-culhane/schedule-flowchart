.PHONY: all clean pdf svg

FONT := Iosevka Curly Slab
INKARGS := --batch-process --export-area-drawing --export-margin=5
DOTARGS := -Tsvg:cairo -Nfontname="$(FONT)" -Efontname="$(FONT)"

SOURCES := $(wildcard *.gv)

PDFS := $(SOURCES:%.gv=%.pdf)
SVGS := $(SOURCES:%.gv=%.svg)

all: pdf svg

pdf: $(PDFS)

svg: $(SVGS)

%.pdf: %.svg
	inkscape $^ $(INKARGS) -o $@

%.svg: %.gv
	dot $^ $(DOTARGS) -o $@

clean:
	rm -f $(PDFS)
	rm -f $(SVGS)
