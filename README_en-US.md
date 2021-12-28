# Sample Template of SJTUThesis

[![Build Status](https://github.com/sjtug/SJTUThesis/actions/workflows/build.yml/badge.svg)](https://github.com/sjtug/SJTUThesis/actions)
[![SJTUTeX](https://img.shields.io/badge/SJTUTheis-v1.0.0rc7-green.svg)](https://github.com/sjtug/SJTUTeX) 
[![Join Discussions](https://img.shields.io/github/discussions/sjtug/SJTUThesis)](https://github.com/sjtug/SJTUThesis/discussions)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

This sample template is a full implementation of SJTUThesis document class which is an *unofficial* LaTeX class for preparing degree theses or course papers in Shanghai Jiao Tong University.

Please note that `sjtuthesis` only supports XeTeX engine, `sjtuthesis` only allows UTF-8 character encoding.

## Obtain Template

### Downloads

You can `clone` this repository directly or download from [Github](https://github.com/sjtug/SJTUThesis).

```bash
git clone https://github.com/sjtug/SJTUThesis.git 
```

### Overleaf

If you are an [Overleaf](https://www.overleaf.com?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b) user, you can create your own project through the link below.

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b) 

## Usage

### Linux & macOS Users

It is recommended to use GNU make utility with `Makefile` provided in template.

```bash
make all                      # compile and generate main.pdf
make clean                    # remove useless files
make cleanall                 # remove everything produced by make all
make wordcount                # count the words of the thesis
```

### Windows Users

We also provided a batch script `Compile.bat` for Windows users. You can double-click the batch file to complie instantly, or use it in a cmd console to access extra features.

```bash
.\Compile.bat thesis          # compile and generate main.pdf
.\Compile.bat clean           # remove useless files
.\Compile.bat cleanall        # remove everything produced by make all
.\Compile.bat wordcount       # count the words of the thesis
```

## Feedback

We are hearing from:

* [Issues page of Github](https://github.com/sjtug/SJTUThesis/issues)
* [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## License

The copyright of image sources including SJTU logo (`sjtu-vi-logo-blue.pdf` etc.)
belongs to Shanghai Jiao Tong University.

`sjtuthesis.cls` document class with related files, and `biblatex-gb7714-2015` biblatex style files is under [LPPL](https://www.latex-project.org/lppl.txt).

The remain part is under [Apache License 2.0](LICENSE).
