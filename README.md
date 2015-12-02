What is SJTUThesis?
======

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

上海交通大学学位论文模板
======

这是为撰写上海交通大学学士、硕士或博士论文而准备的XeLaTeX模板，非官方出品。生成的学位论文文件参见[README.pdf][README]。

如何使用
------

### 系统需求

* 支持XeTeX的**完整**TeX发行版。2015年的[TeXLive](https://www.tug.org/texlive/)和[MacTeX](https://www.tug.org/mactex/)发行版都能编译此模板。
* TeX Gyre Font西文字体和Adobe四款中文字体：AdobeSongStd、AdobeKaitiStd、AdobeHeitiStd、AdobeFangsongStd。
* Windows用户请使用[Cygwin](http://cygwin.com)安装如下工具：git(版本控制)、GNUmake(编译控制)、perl(字数统计)。

### 获取模板

直接下载[最新版模板](https://github.com/weijianwen/SJTUThesis/archive/master.zip)：

	$ wget https://github.com/weijianwen/SJTUThesis/archive/master.zip

也可以从github克隆最新版模板：

	$ git clone https://github.com/weijianwen/SJTUThesis.git

或者是将本地模板更新到最新版

	$ git pull upstream master

### 编译模板

编译模板，生成学位论文PDF文件。GNUMake将调用`latexmk`程序，自动完成模板的多轮编译。平时写论文时推荐使用`make pvc`达到「持续集成」——持续监听文件改动，用户无需操心后台编译的问题，编译好后会自动打开 PDF 文档，这个特性在没定稿之前非常方便！由于 CTeX 下的 Miktex `texify/latexmk` 有可能有问题，故还是推荐 Windows 用户使用 TeXLive 发行版试试看。终端下执行以下命令即可。

```
make pvc
```

由于`latexmk -pvc`使用系统默认的 PDF 阅读器打开编译好的 PDF，且默认不能自动更新 PDF 中的内容。你可以对这一行为进行定制，从而可使用能自动更新 PDF 的阅读器来预览学位论文，通过这种「曲线救国」的方式勉强可以达到「所见即所得」的效果。论文根目录下的`latexmkrc`中已经写好了 OS X 下使用 Skim 来预览 PDF 的配置文件(默认不启用)。其他如 Linux 和 Windows 系统可以参考`latexmk`的手册或是搜索下网路上其他人给出的配置文件进行测试。

如果最终定稿，则使用以下命令编译。

	$ make clean submit.pdf

### 字数统计

	$ make wordcount	

#### Windows用户编译

双击`compile.bat`即可完成编译过程，生成`thesis.pdf`，不依赖于GNUMake。

### 字数统计

	$ make wordcount	

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档[README.pdf][README]中的说明，有助于定位故障。

	$ xelatex thesis
	$ bibtex thesis
	$ xelatex thesis
	$ xelatex thesis

反馈问题
------

建议以如下的顺序反馈使用问题：

* [在github项目主页开issue](https://github.com/weijianwen/sjtu-thesis-template-latex/issues)
* [在水源BBS TeX_LaTeX版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

后续工作计划
------

* 精简代码；
* 改进开章页设计；

其他版本
------

* [v 0.9](https://github.com/weijianwen/SJTUThesis/tree/v0.9): 当前master分支，适配ctex 2.x宏包，需要使用2015年的TeX发行版，无法使用更早的发行版编译。
* [v 0.8](https://github.com/weijianwen/SJTUThesis/tree/v0.8)：使用biber/biblatex处理参考文献，需要使用2014的TeX发行版，无法使用2013年和2015年的TeX发行版编译。
* [v 0.7](https://github.com/weijianwen/SJTUThesis/tree/v0.7)：使用bibex处理参考文献（会产生错误信息，可忽略），需要使用2013或2014年的TeX发行版，无法使用2015年的TeX发行版编译。

软件许可证
------

上海交通大学校徽图片(```sjtulog.png```)和横幅图片(```sjtubanner.png```)的版权归原作者所有。其他部分使用[Apache License 2.0](LICENSE)授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
