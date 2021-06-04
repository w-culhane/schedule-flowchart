.PHONY: all clean pdf svg

SOURCES := $(wildcard *.gv)

PDFS = $(SOURCES:%.gv=%.pdf)
SVGS = $(SOURCES:%.gv=%.svg)

all: pdf svg

pdf: $(PDFS)

svg: $(SVGS)

%.pdf: %.svg
	inkscape $^ --batch-process --export-area-drawing -o $@

%.svg: %.gv
	dot -Tsvg $^ -o $@

clean:
	rm -f $(PDFS)
	rm -f $(SVGS)
