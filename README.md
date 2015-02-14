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

* 支持XeTeX的TeX发行版。经过测试， 2013年以后发行的CTeX、TeXLive和MacTeX都能编译此文档。
* 系统中安装了TeX Gyre Font和四款Adobe中文字体：AdobeSongStd、AdobeKaitiStd、AdobeHeitiStd、AdobeFangsongStd。

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

	$ make clean all

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
* 使用良好的"LaTeX代码风格"改写文档源代码
	* 使用 \command{body} 形式调用命令，避免无括号、等号指定；
	* 避免在模板中使用 plain TeX 代码；
* 模板和模板讲解分开——模板使用说明放在idx中，模板文件留几个空壳就可以，方便大家填入内容，也能保持模板核心内容简洁。
* 使用```biber```模块替代```bibtex```处理参考文献。

开源许可证
======

[MIT License](LICENSE)
