%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%% based on CASthesis.cls -- http://www.ctex.org/PackageCASthesis
%% Hosted on https://github.com/weijianwen/sjtu-thesis-template-latex
%% SJTU LaTeX Forum https://bbs.sjtu.edu.cn/bbsdoc,board,TeX_LaTeX.html
%% Encoding: UTF-8
%% ==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis.cls}[2012/12/05 v0.5 sjtuthesis document class]
\newif\ifsjtu@typeinfo \sjtu@typeinfotrue
\DeclareOption{notypeinfo}{\sjtu@typeinfofalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[fancyhdr,fntef,UTF8,adobefonts]{ctexbook}[2005/11/25]

%% 导入 sjtuthesis.cfg 文件
\AtEndOfPackage{\makeatletter\input{sjtuthesis.cfg}\makeatother}

%% 当前模板的版本
\newcommand{\version}{\sjtu@value@templateversion}

% XeTeX Fonts
\RequirePackage{fontspec}
\RequirePackage{metalogo} % Some Logo
\setmainfont{TeX Gyre Termes}

%% 页边距设置
\oddsidemargin 1.5 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 1.5 true cm
\fi
\textheight 21 true cm
\textwidth 14.5 true cm
\headheight 15pt
\parskip 0.5ex plus 0.25ex minus 0.25ex
%% 上边距
\addtolength{\voffset}{-0.5cm}

%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

%% Math Tools
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}

%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

% 可伸长的数学符号
\def\ExtendSymbol#1#2#3#4#5{\ext@arrow 0099{\arrowfill@#1#2#3}{#4}{#5}}
\def\RightExtendSymbol#1#2#3#4#5{\ext@arrow 0359{\arrowfill@#1#2#3}{#4}{#5}}
\def\LeftExtendSymbol#1#2#3#4#5{\ext@arrow 6095{\arrowfill@#1#2#3}{#4}{#5}}

\newcommand\myRightarrow[2][]{\RightExtendSymbol{=}{=}{\Rightarrow}{#1}{#2}}
\newcommand\myLeftarrow[2][]{\LeftExtendSymbol{\Leftarrow}{=}{=}{#1}{#2}}
\newcommand\myBioarrow[2][]{\ExtendSymbol{\Leftarrow}{=}{\Rightarrow}{#1}{#2}}
\newcommand\myLongEqual[2][]{\ExtendSymbol{=}{=}{=}{#1}{#2}}

% bullets in the item
\renewcommand\labelitemi{\ensuremath{\bullet}} % 原来定义为 \textbullet

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}
%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
\RequirePackage{ccaption}
\captiondelim{\ }
\captionnamefont{\kaishu\small}
\captiontitlefont{\kaishu\small}


%% sort and compress citations
\RequirePackage[sort&compress,numbers]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}--\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}--\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}--\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


%% 一些有趣的符号图案
\RequirePackage{marvosym}
\RequirePackage{wasysym}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{\sjtu@value@listingname} %% 重命名Listings标题头


%% hyperref package

\ifxetex  % xelatex
\RequirePackage[xetex]{hyperref}
\hypersetup{
  bookmarksnumbered,%
  colorlinks,%
  linkcolor=blue,%
  citecolor=blue,%
  plainpages=false,%
  pdfstartview=FitH
}
\fi

%% enumerate 列表环境间距调节
% Ref: http://bbs.ctex.org/viewthread.php?tid=52331&page=1
\RequirePackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}  

%  参考文献风格 GBT7714-2005
\bibliographystyle{GBT7714-2005NLang}

% sjtuspace
\newcommand\sjtuspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\sjtu@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\sjtufiledate{#1}%
  \def\sjtufileversion{#2}%
  \def\sjtufileinfo{#3}}%
\expandafter\ifx\csname ver@sjtuthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_sjtuthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@sjtuthesis.cls\endcsname}
\fi
\expandafter\sjtu@getfileinfo\reserved@a\relax? ? \relax\relax
\def\sjtu@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\sjtuunderline{\@ifnextchar[\sjtu@underline\CTEXunderline}


\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\UDC[1]{\def\sjtu@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\sjtu@value@serialnumber{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\degree[1]{\def\sjtu@value@degree{#1}}
\renewcommand\title[2][\sjtu@value@title]{%
  \def\sjtu@value@title{#2}
  \def\sjtu@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\sjtu@value@author{#1}}
\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\sjtu@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}


% “绘制”SJTU中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      
\songti\zihao{-3}\sjtu@label@statement

    \vskip \stretch{1}
       {\heiti\zihao{3} \sjtu@value@title}
    \vskip \stretch{1}
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{lc}
      \heiti\sjtu@label@author &\songti
      \sjtuunderline[150pt]{\sjtu@value@author}
    \\
      \heiti\sjtu@label@studentnumber &\songti
      \sjtuunderline[150pt]{\sjtu@value@studentnumber}
    \\
      \heiti\sjtu@label@advisor &\songti
      \sjtuunderline[150pt]{\sjtu@value@advisor}
    \\  
      \heiti\sjtu@label@major &\songti
      \sjtuunderline[150pt]{\sjtu@value@major}
    \\  
      \heiti\sjtu@label@defenddate &\songti
      \sjtuunderline[150pt]{\sjtu@value@defenddate}
    \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifsjtu@typeinfo
    \fi
    \cleardoublepage
  \fi
}


% English Title Page
\newcommand\englishtitle[1]{\def\sjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\sjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\sjtu@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\sjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\sjtu@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\sjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\sjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\sjtu@value@englishmajor{#1}}
% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\normalfont\zihao{4} \sjtu@label@englishstatement}
    \vspace*{20pt}
    \vskip\stretch{1}
     {\zihao{-1} \sjtu@value@englishtitle}
    \vskip \stretch{1}
      {\normalfont\zihao{4} \sjtu@value@englishauthor}
    \vskip \stretch{1}
      {\normalfont\zihao{4} \sjtu@label@englishadvisor}
    \vskip 3pt
      {\normalfont\zihao{4} \sjtu@value@englishadvisor}
    \vskip \stretch{2}
      \normalfont\normalsize \sjtu@value@englishinstitute
    \vskip 30pt
      \normalfont\normalsize \sjtu@value@englishdate
    \vskip 20pt
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\bf\zihao{3} \sjtu@value@school}\\
  {\bf\zihao{3} \sjtu@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{-4}\sjtu@label@originalcontent}
  \vskip 60pt
  \hspace{13em}\sjtu@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\sjtu@label@originalDate\hspace{1em}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\bf\zihao{3} \sjtu@value@school}\\
  {\bf\zihao{3} \sjtu@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{-4} \sjtu@label@authorizationcontent}
  \vskip 60pt
  
  \sjtu@label@authorsign\hrulefill\hspace{3em}\sjtu@label@Supervisorsign\hrulefill
  \vskip 15pt
  \sjtu@label@originalDate\hfill\hspace{3em}\sjtu@label@originalDate
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

\pagestyle{fancy} {
	\fancyhf{}
	\fancyhead[LO, RE]{\small {\it \sjtu@value@school\sjtu@value@degree\sjtu@label@thesis}}  % 奇数页左页眉和偶数页右页眉，即靠近书籍的页眉
	\fancyhead[RO]{\small {\it \leftmark}}                   % 奇数页右页眉
	\fancyhead[LE]{\small {\it \sjtu@value@titlemark}}  % 偶数页左页眉
	\fancyfoot[C]{\small ~---~{\bf\thepage}~---~}      % 页脚
}

\fancypagestyle{plain} { % 设置开章页页眉页脚风格
  \fancyhf{}
  \fancyhead[LO,RE]{\small {\it \sjtu@value@school\sjtu@value@degree\sjtu@label@thesis}}  % 奇数页左页眉和偶数页右页眉，即靠近书籍的页眉
  \fancyhead[RO]{\small {\it \leftmark}}                   % 奇数页右页眉
  \fancyhead[LE]{\small {\it \sjtu@value@titlemark}} 	 % 偶数页左页眉
  \fancyfoot[C]{\small ~---~{\bf\thepage}~---~} %页脚格式
}

 % 中文摘要
 \newenvironment{abstract}{\chapter[摘要]{\sjtu@value@title\vskip 20pt\sjtu@label@abstract}}{}

 % 中文关键词
 \newcommand\keywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@keywords} #1}

 %_ 英文摘要
 \newenvironment{englishabstract}{\chapter[ABSTRACT]{\sjtu@value@englishtitle\vskip 20pt\bfseries \sjtu@label@englishabstract}}{}

 % _英文摘要
 \newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@englishkeywords} #1}

% 目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}


\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\chapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

    
\newenvironment{publications}[1]
     {\chapter{\sjtu@label@publications}%
      \@mkboth{\MakeUppercase\sjtu@label@publications}
              {\MakeUppercase\sjtu@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\sjtu@label@projects}%
      \@mkboth{\MakeUppercase\sjtu@label@projects}
              {\MakeUppercase\sjtu@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}
    
    \newenvironment{resume}
  {\chapter{\sjtu@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}
  {\chapter{\sjtu@label@thanks}}
  {}
  
\newenvironment{symbolnote}
  {\chapter{\sjtu@label@symbolnote}}
  {} 


\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
    
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput

%%
%% End of file `sjtuthesis.cls'.


