# Sample Template of SJTUThesis

[![Build Status](https://github.com/sjtug/SJTUThesis/actions/workflows/build.yml/badge.svg)](https://github.com/sjtug/SJTUThesis/actions)
[![SJTUTeX](https://img.shields.io/github/v/release/sjtug/SJTUTeX?label=SJTUTeX)](https://github.com/sjtug/SJTUTeX) 
[![Join Discussions](https://img.shields.io/github/discussions/sjtug/SJTUThesis)](https://github.com/sjtug/SJTUThesis/discussions)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

This sample template is a derived from the  SJTUThesis document class.
Please note that we support the LuaTeX engine with UTF-8 character encoding.

### Overleaf

If you are an [Overleaf](https://www.overleaf.com?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b) user, you can create your own project through the link below.

[![Overleaf](https://img.shields.io/badge/Overleaf-SJTUThesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b) 

## Usage

### Linux & macOS Users

It is recommended to use GNU make utility with `Makefile` provided in the template.
the 
```bash
make all                      # compile and generate main.pdf
make clean                    # remove useless files
make cleanall                 # remove everything produced by make all
make wordcount                # count the words of the thesis
```

### Windows Users

We also provided a batch script `Compile.bat` for Windows users. You can double-click the batch file to compile instantly, or use it in Command Prompt to access extra features.

```bash
.\Compile.bat thesis          # compile and generate main.pdf
.\Compile.bat clean           # remove useless files
.\Compile.bat cleanall        # remove everything produced by make all
.\Compile.bat wordcount       # count the words of the thesis
```

## Feedback

We are hearing from:

* [Discussions page of GitHub](https://github.com/sjtug/SJTUThesis/discussions) (Recommended for usage problems)
<!-- * [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX) -->

## License

The copyright is under the  [Apache License 2.0](LICENSE).
