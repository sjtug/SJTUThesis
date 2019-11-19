# SJTUThesis

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![Join the chat at https://gitter.im/sjtug/SJTUThesis](https://badges.gitter.im/sjtug/SJTUThesis.svg)](https://gitter.im/sjtug/SJTUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

SJTUThesis is an *unofficial* LaTeX template for preparing bachelor, master, doctor thesis or course papers in Shanghai Jiao Tong University.

At present, `sjtuthesis` only supports XeTeX engine. `sjtuthesis` only allows UTF-8 character encoding.

## 1. Obtain SJTUThesis

### 1.1 Downloads

You can clone this repository directly or just download from github
```bash
git clone https://github.com/sjtug/SJTUThesis.git 
```

### 1.2 Overleaf

[Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) users are able to create project from the template link below.

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/spmggcjfshrb?r=b3b31f49&rm=d&rs=b) 

## 2. How to Compile
### 2.1 Linux of MacOS Users
you can use `make` to compile directly:

```bash
make all       # compile and generate Thesis.pdf
make clean     # remove useless files
make cleanall  # remove everything produced by make all
make wordcount # count the words of the thesis
```
### 2.2 Windows Users
We suggest using `compile.bat`.
## Feedback

We are hearing from:

* [issue page of Github](https://github.com/sjtug/SJTUThesis/issues)
* [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## License

The copyright of image sources including SJTU logo (`sjtulogo.pdf` etc.)
belongs to Shanghai Jiao Tong University.

The remain part is under [LPPL](LICENSE)
