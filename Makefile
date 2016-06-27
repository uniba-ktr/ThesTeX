# Copyright 2016, Marcel Großmann <marcel.grossmann@uni-bamberg.de>
objects = thesis.pdf
hooks = post-checkout post-commit post-merge
githooks = .git/hooks

.PHONY: all clean

# Builds and cleans latex crap
all: $(objects) cleanTemp

$(objects): %.pdf :%.tex
	latexmk -pdf -pdflatex="pdflatex -shell-escape -synctex=1 -interaction=nonstopmode" -use-make $<

cleanTemp:
	latexmk -c
	rm -f *.bbl *.nlo *.nls *.loa

clean: cleanTemp
	latexmk -CA
	rm -f *.synctex.gz

git: $(hooks)

$(hooks):
	cp gitinfo2-hook.txt $(githooks)/$@
	chmod u+x $(githooks)/$@

docker:
	docker-compose run builder
