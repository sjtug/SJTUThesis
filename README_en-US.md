# SJTUThesis

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![Join the chat at https://gitter.im/sjtug/SJTUThesis](https://badges.gitter.im/sjtug/SJTUThesis.svg)](https://gitter.im/sjtug/SJTUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

SJTUThesis is an *unofficial* LaTeX template for preparing bachelor, master, doctor thesis or course papers in Shanghai Jiao Tong University.

At present, `sjtuthesis` only supports XeTeX engine. `sjtuthesis` only allows UTF-8 character encoding.

## Obtain SJTUThesis

### Downloads

We'd recommend to use packed files downloaded from [Releases](https://github.com/sjtug/SJTUThesis/releases) page directly for normal users.

| Filename | Description |
| --- | --- |
| sjtuthesis-vXXX.zip | Packed file for local usage，samples included |
| sjtuthesis.tds.zip | TDS（TeX Directory Structure）package |
| sjtuthesis.pdf | Document for SJTUThesis |

Please read `sjtuthesis.pdf` carefully before using the template. And do not
use `xelatex` to compile `thesis.tex` directly:

```bash
xelatex thesis.tex 
```

We highly recommend using `Makefile` or `compile.bat`(for Windows users) 
to compile.

### Overleaf

[Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) users are able to create project from the template link below.

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/spmggcjfshrb?r=b3b31f49&rm=d&rs=b) 

### Generate manually

The source of SJTUThesis located in `source/sjtuthesis.dtx`, you can use `make` to generate the packed files:

```bash
make            # generate the template and pack files
make install    # install sjtuthesis into your local TeX system
```

The default output folder is `release`.

## Feedback

We are hearing from:

* [issue page of Github](https://github.com/sjtug/SJTUThesis/issues)
* [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## License

The copyright of image sources including SJTU logo (`sjtulogo.pdf` etc.)
belongs to Shanghai Jiao Tong University.

The remain part is under [LPPL](LICENSE)
