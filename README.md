# SJTUThesis

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![Join the chat at https://gitter.im/sjtug/SJTUThesis](https://badges.gitter.im/sjtug/SJTUThesis.svg)](https://gitter.im/sjtug/SJTUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## 欢迎使用上海交通大学论文模板

这是为撰写上海交通大学学士、硕士、博士学位论文以及课程论文而准备的（非官方）LaTeX 模板。

本模板目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 1. 获取 SJTUThesis

### 1.1 本地下载

普通用户可以直接clone或者在github上下载这个仓库
```
git clone https://github.com/sjtug/SJTUThesis.git
```

### 1.2 Overleaf

[Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) 用户可以从下面的模版链接创建自己的项目。

[![Overleaf](https://img.shields.io/badge/overleaf-sjtuthesis-green.svg)](https://www.overleaf.com/latex/templates/sjtuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/spmggcjfshrb?r=b3b31f49&rm=d&rs=b) 

### 1.3 开发者
SJTUThesis 是一个由诸多感兴趣的同学一起维护的开源项目，我们非常欢迎新的贡献者!

但是要注意的是这个仓库只是**面向用户的示例仓库**，如果你想要为这个项目贡献代码，可移步[SJTUTex](https://github.com/AlexaraWu/sjtutex)。在贡献之前，你可以从[这些问题](https://github.com/sjtug/SJTUThesis/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue)开始熟悉贡献代码的流程。

如果你对这个模板感兴趣，除了提交pull request之外，还有以下方式可以进行贡献：
* 帮助我们解答同学们的[问题](https://github.com/sjtug/SJTUThesis/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Atype%2Fquestion+)，这些问题你也可能遇到过并且知道如何解决
* 与我们一起维护项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)，Wiki 是可以直接编辑的。
* 向周围同学安利 SJTUThesis，让更多的同学使用我们维护的模板。
* 在我们的[在线聊天频道上](https://gitter.im/sjtug/SJTUThesis)告诉我们你的使用体验，以及吐槽。如果你也想成为项目的长期维护者，也可以通过在线频道告诉我们 :-)


## 2. 模板使用
### 2.1 文件结构说明
```
.
├── bib # 参考文献
├── figure　# 图片
├── pdf  # 可插入的pdf以及SJTU的logo 
├── src　# cls与sty文件，也就是documentclass源代码和sjtuthesis宏包源代码
└── tex　# 写论文所需修改的tex源代码
```

### 2.2 如何编译
#### 2.2.1 `Linux`或`MacOS`用户
推荐使用已经编写好的`Makefile`进行tex文件的编译，具体来说我们提供了如下几条可用的命令：
```bash
make all       # 编译生成Thesis.pdf
make clean     # 删除编译所产生的中间文件
make cleanall  # 删除pdf和所有中间文件
make wordcount # 论文字数统计
```
#### 2.2.2 `Windows`用户
对`Windows`用户，我们也提供了`compile.bat`方便一键编译。

**请不要直接使用**`xelatex thesis.tex`进行编译。更多关于模板的实现细节以及使用信息，请查看使用文档`sjtuthesis.pdf`。
## 3. 反馈问题

如果在使用上有任何问题，建议先查阅项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)。如果这些不能解决你的问题，建议以如下的顺序反馈使用过程中的问题：

* [在 GitHub 项目主页开 issue](https://github.com/sjtug/SJTUThesis/issues) (推荐)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

如果你觉得项目的使用体验不好，或者想感谢我们的维护者们等等任何与使用无关的想法，都可以通过我们的[在线聊天频道](https://gitter.im/sjtug/SJTUThesis)告诉我们。

## 4. 致谢

* 感谢 [CTeX](http://www.ctex.org/HomePage) 提供了 LaTeX 的中文支持
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学
* 感谢 William Wang 同学对模板移植做出的巨大贡献
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors)，以及所有测试和使用模板的各位同学

## 软件许可证

上海交通大学校徽图片(`sjtulogo.pdf` 等)的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
