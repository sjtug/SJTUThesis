# Sample Template of SJTUThesis

[![Build Status](https://github.com/sjtug/SJTUThesis/actions/workflows/build.yml/badge.svg)](https://github.com/sjtug/SJTUThesis/actions)
[![SJTUTeX](https://img.shields.io/github/v/release/sjtug/SJTUTeX?label=SJTUTeX)](https://github.com/sjtug/SJTUTeX)
[![Join Discussions](https://img.shields.io/github/discussions/sjtug/SJTUThesis)](https://github.com/sjtug/SJTUThesis/discussions)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

This sample template is a full implementation of SJTUThesis document class which is an LaTeX class for preparing degree theses or course papers at Shanghai Jiao Tong University.

Please note that `sjtuthesis` supports both XeTeX and LuaTeX engine, `sjtuthesis` only allows UTF-8 character encoding.

## Install the TeX Distribution

Since the dependency package [SJTUTeX](https://github.com/sjtug/SJTUTeX) has been retrieved by [CTAN](https://www.ctan.org/pkg/sjtutex), you need to first install the **latest TeX distribution** first and update the packages regularly to use the latest version of SJTUTeX.

## Get the Template

### Downloads

You can `clone` this repository directly or download it from [GitHub](https://github.com/sjtug/SJTUThesis).

```bash
git clone https://github.com/sjtug/SJTUThesis.git
```

### Online LaTeX Editor

[![TeXPage](https://img.shields.io/badge/SJTUThesis-TeXPage-495A80.svg)](https://www.texpage.com/template/542af6f9-f66f-4068-8732-f20fe7bd08ef)

[![Overleaf](https://img.shields.io/badge/SJTUThesis-Overleaf-098842.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg)

You can create your own project through the link above.

If you want to use other online LaTeX editors (such as [SJTU Overleaf](https://latex.sjtu.edu.cn)) which supports the latest TeX distribution, you could download [the latest version](https://github.com/sjtug/SJTUThesis/archive/refs/heads/master.zip) and upload it to the corresponding platform. Notice that the online editors typically use pdfLaTeX compiler by default, you need to change it to XeLaTeX compiler and use the latest TeX distribution.

## Usage

If you are not familiar with the LaTeX compilation process, please follow the instructions below to compile the document.

### Compile with Editors

#### VS Code

Install the "LaTeX Workshop" extension, select the preset recipe `Recipe: latexmk (xelatex)` to compile; you can also change `latex-workshop.latex.recipe.default` to `latexmk (xelatex)` in the settings to set it as the default option.

#### TeXstudio

The template has built-in TeXstudio magic comments, can be used out of the box.

### Compile with Scripts

#### Linux & macOS

It is recommended to use GNU make utility with `Makefile` provided in the template.

```bash
make all                      # compile and generate main.pdf
make clean                    # remove useless files
make cleanall                 # remove everything produced by make all
make wordcount                # count the words of the thesis
```

#### Windows

We also provided a batch script `Compile.bat` for Windows users. You can double-click the batch file to compile instantly, or use it in Command Prompt to access extra features.

```bash
.\Compile.bat thesis          # compile and generate main.pdf
.\Compile.bat clean           # remove useless files
.\Compile.bat cleanall        # remove everything produced by make all
.\Compile.bat wordcount       # count the words of the thesis
```

For more information about the implementation and usage of the template, please refer to the document [`sjtutex.pdf`](https://mirrors.ctan.org/macros/latex/contrib/sjtutex/sjtutex.pdf).

## Feedback

We are hearing from:

* [Discussions page of GitHub](https://github.com/sjtug/SJTUThesis/discussions) (Recommended for usage problems)
* [Issues page of GitHub](https://github.com/sjtug/SJTUThesis/issues)
<!-- * [SJTU BBS](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX) -->

## License

The copyright of image sources including SJTU logo (`sjtu-vi-logo-*.pdf` etc.)
belongs to Shanghai Jiao Tong University.

`sjtuthesis.cls` document class with related files are under [The LaTeX Project Public License 1.3c](https://www.latex-project.org/lppl.txt).

The remaining parts are under [Apache License 2.0](LICENSE).
