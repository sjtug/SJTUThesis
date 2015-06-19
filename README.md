What is SJTUThesis?
======

SJTUThesis is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Shanghai Jiao Tong University.

上海交通大学学位论文模板
======

这是为撰写上海交通大学学士、硕士或博士论文而准备的XeLaTeX模板，非官方出品。生成的学位论文文件参见[README.pdf][README]。

如何使用
------

### 系统需求

* 支持XeTeX的**完整**TeX发行版。2014年的TeXLive和MacTeX发行版都能编译此模板。
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

编译模板，生成学位论文PDF文件。GNUMake将调用```latexmk```程序，自动完模板的多轮编译。

	$ make clean thesis.pdf

若需要生成用于提交盲审的论文(隐去作者、导师等信息)，可在```thesis.tex```中为```sjtuthesis```文档类添加```review```选项。 若需要生成包含“原创性声明扫描件”和“授权书”签名扫描件的学位论文，请将扫描件分别保存为```pdf/origignal.pdf```和```pdf/authorization.pdf```，然后添加```submit```选项重新编译模板。

### 字数统计

	$ make wordcount	

### 问题诊断

编译失败时，可以尝试手动逐次编译。
结合文档[README.pdf][README]中的说明，有助于定位故障。

	$ xelatex -no-pdf thesis
	$ biber --debug thesis
	$ xelatex thesis
	$ xelatex thesis

已知问题
------

由于新发行版中使用了ctex 2.x宏包，因此论文模板暂不能在TeXLive 2015下编译。

反馈问题
------

建议以如下的顺序反馈使用问题：

* [在github项目主页开issue](https://github.com/weijianwen/sjtu-thesis-template-latex/issues)
* [在水源BBS TeX_LaTeX版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

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

上海交通大学校徽图片(```sjtulog.png```)和横幅图片(```sjtubanner.png```)的版权归原作者所有。其他部分使用[MIT License](LICENSE)授权。

[README]: https://s3.amazonaws.com/sjtuthesis/README.pdf
