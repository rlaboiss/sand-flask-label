SHELL = bash

INFOS = amed.info kuta.info gracetown.info vrango.info langoyene.info
PDFS = $(subst info,pdf,$(INFOS))
PNGS = $(subst info,png,$(INFOS))
.PRECIOUS: $(PNGS)

.PHONY: all
all: $(PDFS)

%.pdf: %.svg
	inkscape --export-type=pdf --export-filename=$@ $<

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
