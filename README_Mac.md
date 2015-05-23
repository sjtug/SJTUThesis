# Mac下使用SJTUThesis

## 安装MacTex

见：[pt](https://github.com/tq5124/SJTUThesis)，是2013的MacTex。也可以从官网下载最新版本。本文档基于2013

## 运行

在项目目录运行`make clean thesis.pdf`

## 错误

### 缺少字体

打开osx自带应用“字体册”，点击“+”，导入6个字体

资源见：[pan.baidu](http://pan.baidu.com/s/1o60xUXG)

### pdf形式的图片无法生成

参考：[Could not insert pdf graphics](http://tex.stackexchange.com/questions/106964/could-not-insert-pdf-graphics)

步骤
```
brew install xpdf
wget http://mirrors.ctan.org/support/epstopdf.zip
unzip epstopdf.zip
cp epstopdf/epstopdf.pl /usr/local/bin/
cd figure/chap2
pdftops sjtulogo.pdf
epstopdf sjtulogo.ps
pdfcrp sjtulogo.pdf
mv sjtulogo.pdf backup.pdf
mv sjtulogo-crop.pdf sjtulogo.pdf
```
