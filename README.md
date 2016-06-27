ThesTeX
=======

A LaTeX template for the bachelor or master thesis

Setup
-----

Edit the <code>\newcommand{\lang}{ngerman}</code> command to setup the language You write your submission in. Possible options are
* <code>ngerman</code> and
* <code>english</code>.

Furthermore, edit the <code>config/metainfo.tex</code> file to include
* your name,
* the title and subtitle (in English and German),
* your desired degree,
* your study course,
* the name of your advisor,
* the submission location of your thesis and
* the submission date.

Compiling the Source Code
-------------------------

### texmaker

Use `latexmk` to generate a readable document, or use `make all` of the `Makefile`.
If You use texmaker, `latexmk` as your default build command

### make

Using make, there are different targets available:

* thesis.pdf: Build pdf file and keep temporary latex files
* cleanTemp: clean up temporary latex files
* all: build pdf and remove temporary files
* clean: remove all generated output

### ant

Using make, there are different targets available:

* full: just like the command for texmaker (default)
* latex: only pdflatex
* bibtex
* index
* nomenclature
* fast: pdflatex, bibtex, pdflatex
* clean: remove all temporary and auxiliary files, keep pdf
* wipe: clean + remove pdf
* help
* init: increments buildnumber in build.number
* reset: deletes build.number
