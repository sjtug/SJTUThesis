# 上海交通大学学位论文模板

这是为撰写上海交通大学学士、硕士或博士论文而准备的 XeLaTeX 模板，非官方出品。生成的学位论文文件参见 [README.pdf][README]，详细使用说明参见 [SJTUThesis Wiki](https://github.com/sjtug/SJTUThesis/wiki)，欢迎大家分享使用经验。

## 如何使用

SJTUThesis可以在本地编译，也可以在线编译。

### 本地编译 - 系统需求

#### TeX 发行版

SJTUThesis 需要使用 XeTeX 引擎编译。Linux 用户可以安装 [TeX Live](https://www.tug.org/texlive/)，MacOS 用户可以安装 [MacTeX](https://www.tug.org/mactex/)，Windows 用户可以安装 [CTeX 套装（包含完整版 MiKTeX）](http://www.ctex.org/CTeXDownload)。

注：**Windows用户**推荐使用 [Babun](http://babun.github.io/) 作为命令行终端。Babun 已默认安装有这些工具：git(用于版本控制)、GNUmake(用于编译控制)、perl(用于字数统计)。

#### 中文字体

SJTUThesis 由 [CTeX](https://www.ctan.org/pkg/ctex?lang=en) 宏集提供中文支持，默认情况下可以自动检测操作系统选择字体配置，同时 CTeX 宏集也提供了相应选项以供在自动配置失效或用户有特殊需求的情况下使用。

### 获取模板

根据「系统需求」中情形选择适合你系统情况的分支，然后根据情况选择 git 克隆最新版代码或者下载稳定版压缩包。

#### 终端中克隆最新版

    cd
    git clone https://github.com/sjtug/SJTUThesis.git

如果之前有克隆过此模板但是想与 GitHub 上的最新版本同步，以`master`分支为例，执行以下命令更新到最新版。

    git pull origin master

若是自己 fork 后克隆下来的，则执行以下命令。
```
git pull upstream master
```

#### 压缩包下载

SJTUThesis提供了多个稳定版供您使用，这些版本的输出结果具有相近的外观，但依赖不同的TeXLive发行版和参考文献处理程序。

| TeXLive发行版 | 参考文献风格  | SJTUThesis版本 |
|---------------|---------------|----------------|
| 2016,2017     | GB7714        | [0.9.5][0.9.5] |

### 编译模板

编译模板，生成学位论文PDF文件。GNUMake将调用`latexmk`程序，自动完成模板的多轮编译。

    make pvc

定稿后可使用以下命令生成最终版本。

    make clean thesis.pdf

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在`thesis.tex`中为`sjtuthesis`文档类添加`review`选项。 若需要生成包含“原创性声明扫描件”和“授权书”签名扫描件的学位论文，请将扫描件分别保存为`pdf/origignal.pdf`和`pdf/authorization.pdf`，然后添加`submit`选项重新编译模板。

#### Windows用户编译

双击`compile.bat`即可完成编译过程，生成`thesis.pdf`，不依赖于 GNUMake。

### 字数统计

    make wordcount

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档 [README.pdf][README] 中的说明，有助于定位故障。

    xelatex -no-pdf thesis
    biber --debug thesis
    xelatex thesis
    xelatex thesis

## 反馈问题

建议以如下的顺序反馈使用问题：

* [在 GitHub 项目主页开 issue](https://github.com/sjtug/SJTUThesis/issues)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

## 后续工作计划

* 精简代码；
* 改进开章页设计；

## 软件许可证

上海交通大学校徽图片(`sjtulogo.pdf` 等)的版权归上海交通大学所有。其他部分使用 [Apache License 2.0](LICENSE) 授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
[0.9.5]: https://github.com/sjtug/SJTUThesis/releases/tag/0.9.5
