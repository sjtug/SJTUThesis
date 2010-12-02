%%==================================================
%% sjtumaster-xetex.cls for SJTU Master Thesis
%% based on CASthesis.cls -- http://www.ctex.org/PackageCASthesis
%% modified by wei.jianwen@gmail.com
%% Encoding: UTF-8
%% version: 0.2a
%% last update: Dec 2nd, 2010
%% ==================================================


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtumaster-xetex}
  [2009/12/25 v0.2a sjtumaster-xetex
   document class]
\newif\ifCAST@typeinfo \CAST@typeinfotrue
\DeclareOption{notypeinfo}{\CAST@typeinfofalse}
\newif\ifCAST@dvips \CAST@dvipsfalse
\DeclareOption{dvips}{\CAST@dvipstrue}
\DeclareOption{dvipdfm}{\CAST@dvipsfalse}
\DeclareOption{pdftex}{\CAST@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[fancyhdr,fntef,UTF8,adobefonts]{ctexbook}[2005/11/25]


\AtEndOfPackage{\makeatletter\input{sjtumaster-xetex.cfg}\makeatother}
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
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


%% check pdfTeX mode
\RequirePackage{ifpdf}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}

%% Times Fonts
\RequirePackage{times}

%_ added by wei.jianwen@gmail.com
\RequirePackage{ccaption}
\captiondelim{\ }
\captionnamefont{\kaishu\zihao{5}}
\captiontitlefont{\kaishu\zihao{5}}

%% graphics packages
\RequirePackage[dvips]{graphicx}
% \RequirePackage{graphicx}

%% sort and compress citations
\RequirePackage[sort&compress,numbers]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


%_ added by wei.jianwen@gmail.com
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


%% ==================================================
%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
% \DeclareGraphicsExtensions{.eps,.pdf,.jpg,.png}
%% 让 latex 从 .bb 中读取 Bounding Box 信息
% \DeclareGraphicsRule{.jpg}{eps}{.bb}{}
% \DeclareGraphicsRule{.png}{eps}{.bb}{}
% \DeclareGraphicsRule{.pdf}{eps}{.bb}{}
%% ==================================================

%% hyperref
% \RequirePackage[dvipdfm]{hyperref}
% \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
% configuration of hyperref package
% \hypersetup{CJKbookmarks,%
%   bookmarksnumbered,%
%   colorlinks,%
%   linkcolor=blue,%
%   citecolor=blue,%
%   plainpages=false,%
%   pdfstartview=FitH
% }

\ifxetex  % xelatex
\usepackage[xetex]{hyperref}
\else
\ifpdf    % pdflatex
\usepackage[pdftex,unicode]{hyperref}
\else     % dvipdfmx or dvips
\usepackage[dvipdfmx,unicode]{hyperref}
\fi
\fi

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}
% \bibliographystyle{thubib}
% \newcommand\thudot{\unskip.}
% \newcommand\thumasterbib{[Master Thesis]}
% \newcommand\thuphdbib{[Doctor Thesis]}

%_ CASTspace
\newcommand\CASTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\CAST@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\CASTfiledate{#1}%
  \def\CASTfileversion{#2}%
  \def\CASTfileinfo{#3}}%
\expandafter\ifx\csname ver@sjtumaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_sjtumaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@sjtumaster-xetex.cls\endcsname}
\fi
\expandafter\CAST@getfileinfo\reserved@a\relax? ? \relax\relax
\def\CAST@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\CASTunderline{\@ifnextchar[\CAST@underline\CTEXunderline}


\newcommand\classification[1]{\def\CAST@value@classification{#1}}
\newcommand\studentnumber[1]{\def\CAST@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\CAST@value@confidential{#1}}
\newcommand\UDC[1]{\def\CAST@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\CAST@value@serialnumber{#1}}
\newcommand\school[1]{\def\CAST@value@school{#1}}
\newcommand\degree[1]{\def\CAST@value@degree{#1}}
\renewcommand\title[2][\CAST@value@title]{%
  \def\CAST@value@title{#2}
  \def\CAST@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\CAST@value@author{#1}}
\newcommand\advisor[1]{\def\CAST@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\CAST@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\CAST@value@major{#1}}
\newcommand\submitdate[1]{\def\CAST@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\CAST@value@defenddate{#1}}
\newcommand\institute[1]{\def\CAST@value@institute{#1}}
\newcommand\chairman[1]{\def\CAST@value@chairman{#1}}


%_ “绘制”SJTU中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      
\songti\zihao{-3}\CAST@label@statement

    \vskip \stretch{1}
       {\heiti\zihao{3} \CAST@value@title}
    \vskip \stretch{1}
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{lc}
      \heiti\CAST@label@author &\songti
      \CASTunderline[150pt]{\CAST@value@author}
    \\
      \heiti\CAST@label@studentnumber &\songti
      \CASTunderline[150pt]{\CAST@value@studentnumber}
    \\
      \heiti\CAST@label@advisor &\songti
      \CASTunderline[150pt]{\CAST@value@advisor}
    \\  
      \heiti\CAST@label@major &\songti
      \CASTunderline[150pt]{\CAST@value@major}
    \\  
      \heiti\CAST@label@defenddate &\songti
      \CASTunderline[150pt]{\CAST@value@defenddate}
    \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifCAST@typeinfo
    \fi
    \cleardoublepage
  \fi
}


% English Title Page
\newcommand\englishtitle[1]{\def\CAST@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\CAST@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\CAST@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\CAST@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\CAST@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\CAST@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\CAST@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\CAST@value@englishmajor{#1}}
% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\normalfont\zihao{4} \CAST@label@englishstatement}
    \vspace*{20pt}
    \vskip\stretch{1}
     {\zihao{-1} \CAST@value@englishtitle}
    \vskip \stretch{1}
      {\normalfont\zihao{4} \CAST@value@englishauthor}
    \vskip \stretch{1}
      {\normalfont\zihao{4} \CAST@label@englishadvisor}
    \vskip 3pt
      {\normalfont\zihao{4} \CAST@value@englishadvisor}
    \vskip \stretch{2}
      \normalfont\normalsize \CAST@value@englishinstitute
    \vskip 30pt
      \normalfont\normalsize \CAST@value@englishdate
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
  {\bf\zihao{3} \CAST@value@school}\\
  {\bf\zihao{3} \CAST@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{-4}\CAST@label@originalcontent}
  \vskip 60pt
  \hspace{13em}\CAST@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\CAST@label@originalDate\hspace{1em}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


%_ 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\bf\zihao{3} \CAST@value@school}\\
  {\bf\zihao{3} \CAST@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{-4} \CAST@label@authorizationcontent}
  \vskip 60pt
  
  \CAST@label@authorsign\hrulefill\hspace{3em}\CAST@label@Supervisorsign\hrulefill
  \vskip 15pt
  \CAST@label@originalDate\hfill\hspace{3em}\CAST@label@originalDate
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


%_ 页眉页脚
\pagestyle{fancy}
\fancyhf{}
% \fancyhead[CE]{\small \CAST@value@titlemark}
\fancyhead[LE]{\small {\it \CAST@value@headschoolname}}  % 偶数页左页眉
\fancyhead[RE]{\small \CAST@value@titlemark}       % 偶数页右页眉
% \fancyhead[OE]{}       % 偶数页中页眉
\fancyhead[LO]{\small {\it \CAST@value@headschoolname}}  % 奇数页左页眉
% \fancyhead[RO]{\small \rightmark}
\fancyhead[RO]{\small \leftmark}                   % 奇数页左页眉
% \fancyhead[OE]{}       % 奇数页中页眉
% \fancyfoot[OL]{\bfseries \small ~---~\thepage~---~}
\fancyfoot[C]{\small ~---~{\bf\thepage}~---~}      % 页脚
% \fancyfoot[LE,RO]{\bfseries \small ~--~\thepage~--~}


\fancypagestyle{plain}{% 设置开章页页眉页脚风格
  \fancyhf{}%
  % \fancyfoot[C]{\bfseries \small ~第~\thepage~页~}
 \fancyfoot[C]{\small ~---~{\bf\thepage}~---~} %%首页页脚格式
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% 每一章的首页也使用fancyhdr的页眉页脚设置
% \makeatletter
% \let\ps@plain\relax
% \let\ps@plain=\ps@fancy
% \makeatother
 

 %_ 中文摘要
 \newenvironment{abstract}
 {\chapter[\heiti 摘要]{\CAST@value@title\vskip 20pt\CAST@label@abstract}}
 {}

 %_ 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bf\large \CAST@label@keywords} #1}

 %_ 英文摘要
 \newenvironment{englishabstract}
 {\chapter[\heiti ABSTRACT]{\CAST@value@englishtitle\vskip 20pt\bfseries \CAST@label@englishabstract}}
 {}

 % _英文摘要
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf\large \CAST@label@englishkeywords} #1}


%_ 目录
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
     {\chapter{\CAST@label@publications}%
      \@mkboth{\MakeUppercase\CAST@label@publications}
              {\MakeUppercase\CAST@label@publications}%
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

    \newenvironment{resume}
  {\chapter{\CAST@label@resume}}
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
  {\chapter{\CAST@label@thanks}}
  {}
  
\newenvironment{symbolnote}
  {\chapter{\CAST@label@symbolnote}}
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
%% End of file `sjtumaster-xetex.cls'.


