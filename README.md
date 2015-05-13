What is SJTUThesis?
======

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

上海交通大学学位论文模板
======

这是为撰写上海交通大学学士、硕士或博士论文而准备的XeLaTeX模板，非官方出品。生成的学位论文文件参见[README.pdf][README]。

如何使用
------

### 系统需求

* 支持XeTeX的**完整**TeX发行版。2014年以后的CTeX、TeXLive和MacTeX发行版应该都能编译此模板。
* TeX Gyre Font西文字体和Adobe四款中文字体：AdobeSongStd、AdobeKaitiStd、AdobeHeitiStd、AdobeFangsongStd。
* 用于合并PDF文件的[stapler](https://github.com/hellerbarde/stapler)工具，建议通过```pip```或```easy_install```安装。若使用其他PDF工具，譬如[pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)、[PDFCat](http://freecode.com/projects/pdfcat)，请修改Makefile中的相应规则。
* Windows用户请使用[Cygwin](http://cygwin.com)安装git和GNUmake工具。

### 获取模板

直接下载[最新版模板](https://github.com/weijianwen/SJTUThesis/archive/master.zip)：

	$ wget https://github.com/weijianwen/SJTUThesis/archive/master.zip

也可以从github克隆最新版模板：

	$ git clone https://github.com/weijianwen/SJTUThesis.git

或者是将本地模板更新到最新版

	$ git pull upstream master

### 编译模板

编译模板，生成学位论文PDF文件。GNUMake将调用```latexmk```程序，自动完模板的多轮编译。

	$ make clean thesis.pdf

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在导入```sjtuthesis```宏包时添加```review```选项。

若需要生成包含“原创性声明扫描件”的学位论文文档，请将扫描件保存为```statement.pdf```，然后生成```submit.pdf```文件。 stapler程序将被用于PDF文件合并。 **使用前请在Makefile中调整合并的页码范围。** 

	$ make clean submit.pdf

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档[README.pdf][README]中的说明，有助于定位故障。

	$ xelatex thesis
	$ bibtex thesis
	$ xelatex thesis
	$ xelatex thesis

### 反馈问题

建议以如下的顺序反馈使用问题：

* [在github项目主页开issue](https://github.com/weijianwen/sjtu-thesis-template-latex/issues)
* [在水源BBS TeX_LaTeX版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

后续工作计划
------

* 移除冗余代码，适当使用LaTeX命令替换复杂的TeX操作序列。包括移除```sjtuspace```命令、简化页面布局中过于繁杂的操作。
* 增加例子，如Algorithm宏包。
* 使用```biber```模块替代```bibtex```处理参考文献。
* 撰写idx文件。 

其他版本
------

* [v 0.7](https://github.com/weijianwen/SJTUThesis/tree/v0.7)

软件许可证
------

上海交通大学校徽图片(```sjtulog.png```)和横幅图片(```sjtubanner.png```)的版权归原作者所有。其他部分使用[MIT License](LICENSE)授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
