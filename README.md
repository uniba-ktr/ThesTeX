# ThesTeX

LaTeX template for bachelor or master thesis

## Setup

### Easy Initialization with GNU make

Run `make init` in the cloned directory to setup submodules and versioning of your PDF files.

### Without make

 1. First checkout all necessary submodules with `git submodule init` followed by `git submodule update`
 2. Create the directories `graphic`, `code`, `images` and `content`
 3. Copy `meta/style/gitexinfo.sty`, `meta/style/gitinfo2.sty`, `meta/style/IEEEtran.bst` and `meta/style/IEEEtran.cls` to the root of your cloned directory.
 4. For versioning of your PDF files copy `meta/style/gitinfo2-hook.txt` to `.git/hooks/post-checkout`, `.git/hooks/post-commit` and `.git/hooks/post-merge` and make these copies executable.

### Necessary Configurations

 1. Edit the `config/metainfo.tex` file to include
    * your name in the `\author{}` command,
    * the German title in `\title{}` and the English one in `\subtitle{}`,
    * the submission date in `\date{}`,
    * your desired degree in `\newcommand\degree{}`,
    * your study course in `\newcommand\studycourse{}`,
    * the name of your advisor in `\newcommand\advisor{}` and
    * the submission location of your thesis in `\newcommand\location{}`
 2. Modify `\gittrue` to `\gitfalse` in `config/metainfo.tex` to disable git versioning.
 3. Edit the `\selectlanguage{}` command in `thesis.tex` to setup the language you write your submission in. Possible options are
    * `ngerman`
    * `english`

## Generating the PDF

Use `latexmk` to generate a readable document, or use `make all` of the `Makefile`.
If You use texmaker, set `latexmk` as your default build command

## Cleaning Up

Run `make clean` or `latexmk -C` to remove the generated PDF and all temporary LaTeX files.
