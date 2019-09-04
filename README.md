# SJTUThesis

[![Build Status](https://travis-ci.org/sjtug/SJTUThesis.svg?branch=master)](https://travis-ci.org/sjtug/SJTUThesis)
[![GitHub Release](https://img.shields.io/github/release/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/sjtug/SJTUThesis.svg)](https://github.com/sjtug/SJTUThesis/releases)
[![Join the chat at https://gitter.im/sjtug/SJTUThesis](https://badges.gitter.im/sjtug/SJTUThesis.svg)](https://gitter.im/sjtug/SJTUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## 欢迎使用上海交通大学论文模板

这是为撰写上海交通大学学士、硕士、博士学位论文以及课程论文而准备的（非官方）LaTeX 模板。

本模板目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 获取 SJTUThesis

### 下载模版

普通用户推荐在 [Releases](https://github.com/sjtug/SJTUThesis/releases) 页面下载打包好的压缩包直接使用。

| 文件名 | 描述 |
| --- | --- |
| sjtuthesis-vXXX.zip | 本地使用的模版压缩包，包含示例文档 |
| sjtuthesis-overleaf-vXXX.zip | overleaf 在线使用的模版压缩包，包含示例文档，已集成 `biblatex-gb7714-2015`，可直接上传使用 |
| sjtuthesis.tds.zip | 按 TDS（TeX Directory Structure）组织的压缩包 |
| sjtuthesis.pdf | 模版的使用文档 |

### 生成模板

模板的源代码代码位于 `source/sjtuthesis.dtx` 文件中，可以使用 `make` 工具生成模板：

```bash
make            # 生成模板并打包
make install    # 将 sjtuthesis 安装到本地的 TeX 系统中
```

生成的文件默认在 `release` 目录中。

## 反馈问题

如果在使用上有任何问题，建议先查阅项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)。如果这些不能解决你的问题，建议以如下的顺序反馈使用过程中的问题：

* [在 GitHub 项目主页开 issue](https://github.com/sjtug/SJTUThesis/issues) (推荐)
* [在水源 BBS TeX_LaTeX 版发帖](https://bbs.sjtu.edu.cn/bbsdoc?board=TeX_LaTeX)

如果你觉得项目的使用体验不好，或者想感谢我们的维护者们等等任何与使用无关的想法，都可以通过我们的[在线聊天频道](https://gitter.im/sjtug/SJTUThesis)告诉我们。

## 如何贡献

SJTUThesis 是一个由诸多感兴趣的同学一起维护的开源项目，我们非常欢迎新的贡献者! 这里有很多贡献的方式:

* 帮助我们解答同学们的[问题](https://github.com/sjtug/SJTUThesis/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Atype%2Fquestion+)，这些问题你也可能遇到过并且知道如何解决
* 与我们一起维护项目的 [Wiki 文档](https://github.com/sjtug/SJTUThesis/wiki)，Wiki 是可以直接编辑的
* 向我们贡献代码，我们有一些对新的贡献者比较友好的问题，你可以从[这些问题](https://github.com/sjtug/SJTUThesis/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue)开始熟悉贡献代码的流程
* 向周围同学安利 SJTUThesis，让更多的同学使用我们维护的模板
* 在我们的[在线聊天频道上](https://gitter.im/sjtug/SJTUThesis)告诉我们你的使用体验，以及吐槽。如果你也想成为项目的长期维护者，也可以通过在线频道告诉我们 :-)

## 致谢

* 感谢 [CTeX](http://www.ctex.org/HomePage) 提供了 LaTeX 的中文支持
* 感谢那位最先制作出博士学位论文 LaTeX 模板的交大物理系同学
* 感谢 William Wang 同学对模板移植做出的巨大贡献
* 感谢 [@weijianwen](https://github.com/weijianwen) 学长一直以来的开发和维护工作
* 感谢 [@sjtug](https://github.com/sjtug) 以及 [@dyweb](https://github.com/dyweb) 对 0.9.5 之后版本的开发和维护工作
* 感谢所有为模板贡献过代码的[同学们](https://github.com/sjtug/SJTUThesis/graphs/contributors)，以及所有测试和使用模板的各位同学

## 软件许可证

上海交通大学校徽图片(`sjtulogo.pdf` 等)的版权归上海交通大学所有。

其他部分使用 [LPPL](LICENSE) 授权。
