# SJTUThesis 示例模板

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![SJTUTeX](https://img.shields.io/badge/SJTUTheis-v1.0.0rc7-green.svg)](https://github.com/sjtug/SJTUTeX) 
[![Join the chat at https://gitter.im/sjtug/SJTUThesis](https://badges.gitter.im/sjtug/SJTUThesis.svg)](https://gitter.im/sjtug/SJTUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## 欢迎使用上海交通大学论文模板

本示例模板是应用上海交通大学学位论文（非官方）LaTeX 文档类 SJTUThesis 的一个完整实现。演示了排版中常用的例子，包括公式、表格、算法、参考文献等。
用户可以参考或者直接基于此示例文档撰写论文。

请注意 SJTUThesis 目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 获取模板

### 下载模版

普通用户可以直接 `clone` 或者在 [Github](https://github.com/sjtug/SJTUThesis) 页面下载仓库代码。

```bash
git clone https://github.com/sjtug/SJTUThesis.git
```

### Overleaf

[Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) 用户可以从下面的模版链接创建自己的项目。

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=b3b31f49&rm=d&rs=b) 

## 模板使用

如果你不熟悉 LaTeX 的编译流程，请**不要**直接使用编译器进行编译。针对不同的平台，模版提供了相应的编译脚本。

### Linux 与 macOS 用户

推荐使用模版提供的 `Makefile` 进行编译，具体来说我们提供了如下几条可用的命令：

```bash
make all                      # 编译生成 main.pdf
make clean                    # 删除编译所产生的中间文件
make cleanall                 # 删除 main.pdf 和所有中间文件
make wordcount                # 论文字数统计
```

### Windows 用户

对于 Windows 用户，我们也提供了编译脚本 `Compile.bat`。可以双击直接编译，也可以在命令提示符窗口中使用脚本提供的额外功能：

```bash
.\Compile.bat thesis          # 编译生成 main.pdf
.\Compile.bat clean           # 删除编译所产生的中间文件
.\Compile.bat cleanall        # 删除 main.pdf 和所有中间文件
.\Compile.bat wordcount       # 论文字数统计
```

更多关于模板的实现细节以及使用信息，请查看使用文档 `sjtuthesis.pdf`。

## 反馈与贡献

本模版是由诸多感兴趣的同学一起维护的开源项目，我们非常欢迎问题反馈和新的贡献者！

### 反馈问题

如果在使用上有任何问题，建议先查阅项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)。
如果这些不能解决你的问题，建议通过以下方式进行反馈（按推荐顺序排序）：

* [在 GitHub 项目主页开 issue](https://github.com/sjtug/SJTUThesis/issues) (推荐)
* [在水源社区对应板块发帖](https://dev.bbs.sjtu.edu.cn/c/36-category/40-category/40)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

另外也可以在我们的 [Gitter](https://gitter.im/sjtug/SJTUThesis) 在线聊天频道讨论任何有关与模版的话题。

### 成为贡献者

这个仓库是面向用户的**示例模版**，如果你有很好的排版示例，可以提交到此仓库与大家分享。如果你想要为 SJTUThesis 文档类贡献代码，可移步 [SJTUTeX](https://github.com/sjtug/SJTUTeX)。在贡献之前，你可以从[这些问题](https://github.com/sjtug/SJTUThesis/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue)开始熟悉贡献代码的流程。除了提交 Pull Request 之外，还有以下方式可以进行贡献：

* 帮助我们解答同学们的[问题](https://github.com/sjtug/SJTUThesis/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Atype%2Fquestion+)，这些问题你也可能遇到过并且知道如何解决；
* 与我们一起维护项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)，Wiki 任何人都可以直接编辑；
* 向周围同学安利 SJTUThesis，让更多的同学使用我们维护的模板；
* 在我们的[在线聊天频道](https://gitter.im/sjtug/SJTUThesis)上告诉我们你的使用体验，以及吐槽。如果你也想成为项目的长期维护者，也可以通过在线频道告诉我们。:-)


## 致谢

* 感谢 [CTeX-kit](https://github.com/CTeX-org/ctex-kit) 提供了 LaTeX 的中文支持；
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学；
* 感谢 William Wang 同学对模板移植做出的巨大贡献；
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作；
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作；
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors)，以及所有测试和使用模板的各位同学。

## 软件许可证

上海交通大学校徽校名图片（`sjtu-vi-logo-blue.pdf` 等）的版权归上海交通大学所有。

`sjtuthesis.cls` 文档类与相关附属文件，以及 `biblatex-gb7714-2015` 样式文件使用 [LPPL](https://www.latex-project.org/lppl.txt) 授权。

其他部分使用 [Apache License 2.0](LICENSE) 授权。
