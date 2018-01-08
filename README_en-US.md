# What is SJTUThesis?

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)]()

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

The generated thesis example PDF file can be found at `README.pdf` (this file has been removed, see sjtug/SJTUThesis/#26 contributing PDF into repo will increase the repo size) . The user guide will be found at  [SJTUThesis Wiki](https://github.com/sjtug/SJTUThesis/wiki)，welcome for contribution。

## User Guide

`SJTUThesis` can be compile at your local machine, or on the Cloud service.

### System Requirement of Locally Compile

#### TeX Distribution

SJTUThesis requires XeTeX。[TeXLive](https://www.tug.org/texlive/)  distributed on 2014 and 2015,  [MacTeX](https://www.tug.org/mactex/)  released distribution can be used for compile this Template.  CTeX(2.9.2)  in Windows can be also compile  this successfully.

[Babun](http://babun.github.io/) is recommended for **Windows User** as the `bash` terminal, which contains `git`, `GNUmake` and `perl` by default.

#### Fonts

Chinese contents depend on four Adobe Simplified Chinese fonts, and English depends on TeX Gyre Termes font. Tex Gyre Termes can be found from [CTAN](http://www.ctan.org/tex-archive/fonts/tex-gyre/fonts/opentype/public/tex-gyre) . However, in order NOT to violate the font license, we don't provide AdobeSongStd, AdobeKaitiStd, AdobeHeitiStd or AdobeFangsongStd. (see sjtug/SJTUThesis/#74  )

### Cloud Compiling by ShareLaTeX

[ShareLaTeX](https://www.sharelatex.com/) can be used for compiling the SJTUThesis 0.8.1.
Copy the page named [SJTUThesis-0.8](https://www.sharelatex.com/project/56701ac8d63cd1d9646a622f) and then start to write your thesis.

For details, please read [Usage](https://github.com/sjtug/SJTUThesis/wiki/Usage).

### Get the Template

Determine the `git branch` you will use depending on your system environment. `clone` this repo or download the stable distribution package.

#### Git Clone

    # clone a new copy
    cd
    git clone https://github.com/sjtug/SJTUThesis.git
    # OR update the latest code from Github
    git pull origin master
    # OR update to your fork repo
    git pull upstream master


#### Release Package

SJTUThesis provides multiple stale release package, the are used under different TeXLive distribution and different  `bib` compiler:

| TeXLive distribution | bibliography  compiler         | SJTUThesis version |
|---------------|------------------------------|----------------|
| 2015          | biber+biblatex+caspervector  | [0.9.3][0.9.3] |
| 2015          | bibtex+GBT7714-2005NLang.bst | [0.7.7][0.7.7] |
| 2014          | biber+biblatex+caspervector  | [0.8.7][0.8.7] |
| 2013          | bibtex+GBT7714-2005NLang.bst | [0.7.1][0.7.1] |

### Compiling the SJTUThesis

    # compile the SJTUThesis on --watch mode
    make pvc
    # compile, build and release the final PDF
    make clean thesis.pdf

Adding `review` option in `thesis.tex` can remove the name of your supervisor and you
in order to submit for blind review.

    \documentclass[master, adobefonts, review]{sjtuthesis}

The location of _Original Work Declaration_ and _Authorization_ must be `./pdf`:

    \includepdf{pdf/original.pdf}
    \cleardoublepage
    \includepdf{pdf/authorization.pdf}
    \cleardoublepage


#### Windows User Guide

Double click the `complie.bat`, the final PDF file will be named as `thesis.pdf`.


### Word Count

    make wordcount

### Diagnosis

    # compile manully when fail to `make`
    xelatex -no-pdf thesis
    biber --debug thesis
    xelatex thesis
    xelatex thesis

## Feedback

We are hearing from:

* [issue page of Github](https://github.com/sjtug/SJTUThesis/issues)
* [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## Further Plan

* Code refactor,
* Improve the style of Chapter title page

## License

The copyright of image sources including SJTU badge (`sjtulog.png`) and
banner (`sjtubanner.png`) belongs to the original owner.

The remain part is under [Apache License 2.0](LICENSE)

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
[0.9.3]: https://github.com/sjtug/SJTUThesis/releases/tag/0.9.3
[0.8.7]: https://github.com/sjtug/SJTUThesis/releases/tag/0.8.7
[0.7.7]: https://github.com/sjtug/SJTUThesis/releases/tag/0.7.7
[0.7.1]: https://github.com/sjtug/SJTUThesis/releases/tag/0.7.1
