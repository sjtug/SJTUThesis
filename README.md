What is SJTUThesis?
======

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

上海交通大学学位论文模板
======

这是为撰写上海交通大学学士、硕士或博士论文而准备的XeLaTeX模板，非官方出品。
生成的学位论文文件参见：<https://s3-ap-southeast-1.amazonaws.com/sjtuthesis/README.pdf>。

如何使用?
=======

系统需求
-------

* XeTeX的TeX发行版。2013年以后发行的CTeX、TeXLive和MacTeX应该都能编译此模板。
* TeX Gyre Font西文字体和Adobe四款中文字体：AdobeSongStd、AdobeKaitiStd、AdobeHeitiStd、AdobeFangsongStd。
* 用于合并PDF文件的[stapler](https://github.com/hellerbarde/stapler)工具，建议通过```pip```或```easy_install```安装。若使用其他PDF工具，譬如[pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)、[PDFCat](http://freecode.com/projects/pdfcat)，请修改Makefile中的相应规则。

下载模板
-------

可以直接从github克隆模板的仓库：

	$ git clone https://github.com/weijianwen/SJTUThesis.git

或者是将本地代码仓库同步到最新版：

	$ git pull --rebase github master

也可以直接下载最新版的打包文件：

	$ wget https://github.com/weijianwen/SJTUThesis/archive/master.zip

编译模板
-------

编译模板，生成学位论文PDF文件。
若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在```thesis.tex```导入```sjtuthesis```宏包时，添加```review```参数，然后重新编译。

	$ make clean thesis.pdf

若需要生成包含“原创性声明扫描件”的学位论文文档，请将扫描件保存为```statement.pdf```，然后生成```submit.pdf```文件。在此过程中，stapler工具将被用于合并PDF文件。*使用前请在Makefile中调整stapler合并的页码范围。*

	$ make clean submit.pdf

查阅说明文档
------

预先编译的[README.pdf](https://s3-ap-southeast-1.amazonaws.com/sjtuthesis/README.pdf)提供了更详细的使用说明。

反馈问题
=======

建议以如下的顺序反馈使用问题：

* [在github项目主页开issue](https://github.com/weijianwen/sjtu-thesis-template-latex/issues)
* [在水源BBS TeX_LaTeX版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

后续工作计划
=======
* 使用```biber/biblatex```模块替代```bibtex```处理参考文献。
* 模板和模板讲解分开——模板使用说明放在idx中，模板文件留几个空壳就可以，方便大家填入内容，也能保持模板核心内容简洁。

开源许可证
======

[MIT License](LICENSE)
