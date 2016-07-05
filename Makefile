# Copyright 2016, Marcel Großmann <marcel.grossmann@uni-bamberg.de>
objects = thesis.pdf
hooks = post-checkout post-commit post-merge
styles= gitinfo2.sty gitexinfo.sty
bibtexstyles = IEEEtran.bst
gitinfohook = meta/style/gitinfo2-hook.txt
githooks = .git/hooks

.PHONY: all init clean cleanTemp gitmodules docker

.DEFAULT_GOAL := all

all: $(objects) cleanTemp

init: gitmodules $(hooks) $(styles) $(bibtexstyles) $(classes)
	mkdir -p graphic code images content

$(objects): %.pdf :%.tex
	latexmk -pdf -pdflatex="pdflatex -shell-escape -synctex=1 -interaction=nonstopmode" -use-make $<

cleanTemp:
	latexmk -c
	rm -f *.bbl *.nlo *.nls *.loa

clean: cleanTemp
	latexmk -CA
	rm -f *.synctex.gz

gitmodules:
	git submodule init
	git submodule update

$(styles): %.sty : meta/style/%.sty
	cp $^ $@

$(bibtexstyles): %.bst : meta/style/%.bst
	cp $^ $@

$(classes): %.cls : meta/style/%.cls
	cp $^ $@

$(hooks):
	cp $(gitinfohook) $(githooks)/$@
	chmod u+x $(githooks)/$@

docker:
	docker-compose run builder
