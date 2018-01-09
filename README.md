# 上海交通大学学位论文模板

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)]()

这是为撰写上海交通大学学士、硕士或博士论文而准备的 XeLaTeX 模板，非官方出品。生成的学位论文文件参见 [README.pdf][README]，详细使用说明参见 [SJTUThesis Wiki](https://github.com/sjtug/SJTUThesis/wiki)。

## 如何使用

SJTUThesis 可以在本地编译，也可以在线编译。

### 本地编译

本地编译需要依赖一个可用的 LaTeX 发行版, 以及中文字体的支持。

#### TeX 发行版

SJTUThesis 需要使用 XeTeX 引擎编译。，Windows 和 Linux 用户可以安装 [TeX Live](https://www.tug.org/texlive/)，MacOS 用户可以安装 [MacTeX](https://www.tug.org/mactex/)。详细请参见[本地安装使用说明](https://github.com/sjtug/SJTUThesis/wiki/%E6%9C%AC%E5%9C%B0%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)。

注：**Windows 用户**推荐使用 [Babun](http://babun.github.io/) 作为命令行终端。Babun 已默认安装有这些工具：git(用于版本控制)、GNUmake(用于编译控制)、perl(用于字数统计)。

#### 中文字体

SJTUThesis 由 [CTeX](https://www.ctan.org/pkg/ctex?lang=en) 宏集提供中文支持，默认情况下可以自动检测操作系统选择字体配置，同时 CTeX 宏集也提供了相应选项以供在自动配置失效或用户有特殊需求的情况下使用。

#### 获取模板

根据「系统需求」中情形选择适合你系统情况的分支，然后根据情况选择 git 克隆最新版代码或者下载稳定版压缩包。

##### 压缩包下载

[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)

你可以在 [GitHub Release](https://github.com/sjtug/SJTUThesis/releases) 中找到 SJTUThesis 的所有版本，推荐使用最新版本以避免一些问题。

##### 终端中克隆最新版

```shell
git clone https://github.com/sjtug/SJTUThesis.git
```

如果之前有克隆过此模板但是想与 GitHub 上的最新版本同步，以 `master` 分支为例，执行以下命令更新到最新版。

```shell
git pull origin master
```

若是自己 fork 后克隆下来的，则执行以下命令。

```shell
git pull upstream master
```

#### 编译模板

##### 在 Linux 与 macOS 上编译

编译模板，生成学位论文 PDF 文件。GNUMake 将调用 `latexmk` 程序，自动完成模板的多轮编译。

```shell
make pvc
```

定稿后可使用以下命令生成最终版本。

```shell
make cleanall thesis.pdf
```

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在 `thesis.tex` 中为 `sjtuthesis` 文档类添加 `review` 选项。 若需要生成包含“原创性声明扫描件”和“授权书”签名扫描件的学位论文，请将扫描件分别保存为 `pdf/origignal.pdf` 和 `pdf/authorization.pdf`，然后添加 `submit` 选项重新编译模板。

##### 在 Windows 上编译

双击 `compile.bat` 即可完成编译过程，生成 `thesis.pdf`。

#### 字数统计

```shell
make wordcount
```

#### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档 [README.pdf][README] 中的说明，有助于定位故障。

```shell
xelatex -no-pdf thesis
biber --debug thesis
xelatex thesis
xelatex thesis
```

### ShareLaTeX 在线编译

[![](https://img.shields.io/badge/ShareLaTeX-v0.8-green.svg)](https://www.sharelatex.com/templates/566ea0fb08f4ac510fbc6b9e)
[![](https://img.shields.io/badge/ShareLaTeX-v0.9.5-green.svg)](https://www.sharelatex.com/templates/588163ec93a02abc513710fd)

因为 ShareLaTeX 的 GitHub 同步功能是收费的，因此其上模板不再更新，如遇到问题建议尝试本地编译。

## 反馈问题

建议以如下的顺序反馈使用问题：

* [在 GitHub 项目主页开 issue](https://github.com/sjtug/SJTUThesis/issues) (推荐)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## 后续工作计划

* 分离学位论文的使用文档和示例文档，准备提交到 CTAN [#47](https://github.com/sjtug/SJTUThesis/issues/47)

## 致谢

* 感谢 [CTeX](http://www.ctex.org/HomePage) 提供了 LaTeX 的中文支持
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学
* 感谢 William Wang 同学对模板移植做出的巨大贡献
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors), 以及所有测试和使用模板的各位同学

## 软件许可证

上海交通大学校徽图片(`sjtulogo.pdf` 等)的版权归上海交通大学所有。其他部分使用 [Apache License 2.0](LICENSE) 授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
[0.9.5]: https://github.com/sjtug/SJTUThesis/releases/tag/0.9.5
