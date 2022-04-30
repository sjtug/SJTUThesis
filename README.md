# SJTUThesis 示例模板

[![Build Status](https://github.com/sjtug/SJTUThesis/actions/workflows/build.yml/badge.svg)](https://github.com/sjtug/SJTUThesis/actions)
[![SJTUTeX](https://img.shields.io/badge/SJTUTheis-v1.0.0rc7-green.svg)](https://github.com/sjtug/SJTUTeX) 
[![Join Discussions](https://img.shields.io/github/discussions/sjtug/SJTUThesis)](https://github.com/sjtug/SJTUThesis/discussions)

## 欢迎使用上海交通大学论文模板

本示例模板是应用上海交通大学学位论文（非官方）LaTeX 文档类 SJTUThesis 的一个完整实现。演示了排版中常用的例子，包括公式、表格、算法、参考文献等。
用户可以参考或者直接基于此示例文档撰写论文。

请注意 SJTUThesis 目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 获取模板

### 下载模版

普通用户可以直接 `clone` 或者下载 [master.zip](https://github.com/sjtug/SJTUThesis/archive/refs/heads/master.zip)。

```bash
git clone https://github.com/sjtug/SJTUThesis.git
# ...or with SJTUG mirror
git clone https://mirror.sjtu.edu.cn/git/SJTUThesis.git/
```

模版更新频繁，且只维护最新版。如有问题，可以先尝试升级模版，而后根据“反馈问题”一栏进行反馈。

### Overleaf

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b)

点击 [链接](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=sdkbtJ4qGS8kDZQQ&rm=d&rs=b) 即可直接使用。

如果需要在其他在线 LaTeX 平台上使用（比如 latex.sjtu.edu.cn），您可以下载 [最新版压缩包](https://github.com/sjtug/SJTUThesis/archive/refs/heads/master.zip)，然后上传至相应平台。请注意，Overleaf 默认使用 pdflatex 编译，您需要设置使用 XeLaTeX 编译器。

## 模板使用

如果你不熟悉 LaTeX 的编译流程，请**不要**直接使用编译器进行编译。针对不同的平台，模版提供了相应的编译脚本。在编译前，需要安装最新的 TeXLive 发行版。

### VSCode 用户

安装 “LaTeX Workshop” 后，选择 `Recipe: latexmk (xelatex)` 编译即可，并在设置中将 `latex-workshop.latex.recipe.default` 改为 `lastUsed` 以一直使用该选项编译。

### TexStudio 用户

在TexStudio的菜单栏中，Options-Configure TeXstudio界面中，修改以下两处：

Commands-Latexmk一项修改为`latexmk.exe -silent -synctex=1 -xelatex %`

Build-Default Compiler一项修改为`txs:///latexmk`

<details>

<summary>展开配置</summary>

<img src="https://user-images.githubusercontent.com/84025388/142163308-3d31f905-af78-40cb-bff1-851cdab04c87.png" width=500px/>

<img src="https://user-images.githubusercontent.com/84025388/142163346-63ec7b7e-932f-44c5-90c4-3b35e435545d.png" width=500px/>

</details>

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

如果在使用上有任何问题，建议先查阅项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)，并使用左上角的搜索功能进行搜索。
如果以上方法不能解决你的问题，建议通过以下方式进行反馈（按推荐顺序排序）：

* 如遇不会使用、编译错误等问题，请至 [在 GitHub 项目讨论区提问](https://github.com/sjtug/SJTUThesis/discussions) (推荐)
* 如遇模版 BUG，或有新的需求，请至 [在 GitHub 项目中提 issue](https://github.com/sjtug/SJTUThesis/issues)
* 您也可以加入 SJTUG 的 QQ 群和 Telegram 群即时讨论。
    * QQ 群群号 715273806。
    * Telegram 群。首先，关注 [SJTUG 镜像站的通知频道](https://t.me/sjtug_mirrors_news)。而后，加入频道关联的群组。

### 成为贡献者

这个仓库是面向用户的**示例模版**，如果你有很好的排版示例，可以提交到此仓库与大家分享。如果你想要为 SJTUThesis 文档类贡献代码，可移步 [SJTUTeX (v1)](https://github.com/sjtug/SJTUTeX/tree/v1)。

我们正在开发基于 LaTeX3 的新文档类 SJTUTeX v2，本仓库的示例模版对应 SJTUTeX v1。

`texmf/tex/latex/sjtuthesis` 目录下的内容都是通过 SJTUTeX v1 的 `sjtuthesis.dtx` 文件自动生成的。如果您需要修改文档类的内容，应该修改 SJTUTeX 仓库中的 `sjtuthesis.dtx`，而非直接修改 cls 文件。您可以使用 `build_v1.sh` 一键搭建开发环境。这个脚本会下载 SJTUTeX v1 的代码，编译 `.dtx` 文件，并把生成的文件拷贝到 SJTUThesis 的 `texmf` 目录下。

因此，如果您修改了 `sjtuthesis` 模版类，应该先给 `SJTUTeX` 的 `v1` branch 发 PR，然后再将更新同步到本仓库。

在贡献之前，你可以从[这些问题](https://github.com/sjtug/SJTUThesis/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue)开始熟悉贡献代码的流程。除了提交 Pull Request 之外，还有以下方式可以进行贡献：

* 帮助我们解答同学们的[问题](https://github.com/sjtug/SJTUThesis/discussions)，这些问题你也可能遇到过并且知道如何解决；
* 与我们一起维护项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)，Wiki 任何人都可以直接编辑；
* 向周围同学安利 SJTUThesis，让更多的同学使用我们维护的模板；
* 在我们的讨论组中分享你的使用体验，以及吐槽。如果你也想成为项目的长期维护者，也可以通过讨论组告诉我们。:-)


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
