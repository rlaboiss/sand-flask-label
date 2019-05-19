SHELL = bash

PDFS = amed.pdf kuta.pdf gracetown.pdf
PNGS = $(subst pdf,png,$(PDFS))
.PRECIOUS: $(PNGS)

.PHONY: all
all: $(PDFS)

%.pdf: %.svg
	inkscape -A $@ $<

%.svg: %.png template.svg
	DIR=$(CURDIR) ;				\
	STEM=$(shell basename -s .svg $@) ;	\
	TEXT1="$$(cut -d\; -f1 $$STEM.info)" ;	\
	TEXT2="$$(cut -d\; -f2 $$STEM.info)" ;	\
	cp template.svg $@ ;			\
	for i in DIR STEM TEXT1 TEXT2 ; do	\
	    sed -i -e "s|#$$i#|$${!i}|" $@ ;	\
	done

%.png: %.info
	qrencode -s 6 -o $@ $(shell cut $< -d\; -f3)

.PHONY: clean
clean:
	rm -f $(PDFS) $(subst pdf,svg,$(PDFS)) $(PNGS)
