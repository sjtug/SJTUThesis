What is SJTUThesis?
======

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

上海交通大学学位论文模板
======

这是为撰写上海交通大学学士、硕士或博士论文而准备的XeLaTeX模板，非官方出品。生成的学位论文文件参见[README.pdf][README]。

P.S. 该 README 用于重要的文档更新，其他细节更新正考虑逐步搬移到 [SJTUThesis Wiki](https://github.com/weijianwen/SJTUThesis/wiki), 欢迎贡献你的力量。:-)

## 如何使用

使用方法大致可以分为在线和本地两种，在线编辑基于 ShareLaTeX 网站，下面分两种情况做详细说明。

### 在线编译 - ShareLaTeX

TeX 本地编译大家可能比较熟悉，但偶尔也会由于各种各样的原因导致你不能顺畅地在本地使用该模板写论文，这个时候不妨考虑下在 ShareLaTeX 上在线编辑，不受系统的影响，**无需本地安装 TeX 发行版**以及其他字体适配等工作。只要有一个稍微现代一点的浏览器如 Firefox, Chrome/Chromium 就行了。缺点是由于服务器在国外，访问起来不是很快，第一次编译可能会稍慢，这可能与 ShareLaTeX 后端的缓存策略有关。

模板地址 ==> [SJTUThesis Template - ShareLaTeX](https://www.sharelatex.com/templates/566ea0fb08f4ac510fbc6b9e).

如果直接从以上模板新建时显示『500 internal server error』的话说明 ShareLaTeX 的从模板新建的功能挂掉了，且登陆后出现的项目是错误的，务必及时删除。改从 [这里](https://www.sharelatex.com/project/56701ac8d63cd1d9646a622f) 以复制的形式新建你自己的项目。左侧菜单(Menu) -> Copy Project 即导入到自己的项目中。

其他详细截屏教程见 [Usage - 使用文档](https://github.com/weijianwen/SJTUThesis/wiki/Usage)

### 本地编译 - 系统需求

* 支持XeTeX的**完整**TeX发行版。2014年以后的[CTeX](http://www.ctex.org/ctexdownload)、[TeXLive](https://www.tug.org/texlive/)和[MacTeX](https://www.tug.org/mactex/)发行版都能编译此模板。
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

```
$ make clean thesis.pdf
```

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在`thesis.tex`中为`sjtuthesis`文档类添加`review`选项。 若需要生成包含“原创性声明扫描件”和“授权书”签名扫描件的学位论文，请将扫描件分别保存为`pdf/origignal.pdf`和`pdf/authorization.pdf`，然后添加`submit`选项重新编译模板。

#### Windows用户编译

双击`compile.bat`即可完成编译过程，生成`thesis.pdf`，不依赖于GNUMake。

### 字数统计

	$ make wordcount	

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档[README.pdf][README]中的说明，有助于定位故障。

	$ xelatex -no-pdf thesis
	$ biber --debug thesis
	$ xelatex thesis
	$ xelatex thesis

### 反馈问题

建议以如下的顺序反馈使用问题：

* [在 GitHub 项目主页开 issue](https://github.com/weijianwen/SJTUThesis/issues)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

后续工作计划
------

* 精简代码；
* 改进开章页设计；

所有版本
------

* [v 0.8](https://github.com/weijianwen/SJTUThesis/tree/v0.8)[(master)](https://github.com/weijianwen/SJTUThesis)：使用biber/biblatex处理参考文献，需要使用2014年以后的TeX发行版。
* [v 0.7](https://github.com/weijianwen/SJTUThesis/tree/v0.7)：使用bibex处理参考文献，需要使用2013年以后的TeX发行版。

软件许可证
------

上海交通大学校徽图片(```sjtulog.png```)和横幅图片(```sjtubanner.png```)的版权归原作者所有。其他部分使用[Apache License 2.0](LICENSE)授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
