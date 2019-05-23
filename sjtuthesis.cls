%# -*- coding: utf-8-unix -*-
%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis}[2018/01/09 v0.10 Shanghai Jiao Tong University Template]
\def\version{v0.10}
\newif\ifsjtu@coursepaper\sjtu@coursepaperfalse
\newif\ifsjtu@bachelor\sjtu@bachelorfalse
\newif\ifsjtu@master\sjtu@masterfalse
\newif\ifsjtu@doctor\sjtu@doctorfalse
\newif\ifsjtu@english\sjtu@englishfalse
\newif\ifsjtu@review\sjtu@reviewfalse
\newif\ifsjtu@submit\sjtu@submitfalse
\DeclareOption{coursepaper}{\sjtu@coursepapertrue}
\DeclareOption{bachelor}{\sjtu@bachelortrue}
\DeclareOption{master}{\sjtu@mastertrue}
\DeclareOption{doctor}{\sjtu@doctortrue}
\DeclareOption{english}{\sjtu@englishtrue}
\DeclareOption{review}{\sjtu@reviewtrue}
\DeclareOption{submit}{\sjtu@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\ifsjtu@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\else
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\fi
\ifsjtu@coursepaper
  \PassOptionsToClass{zihao=-4}{ctexbook}
\else
  \ifsjtu@bachelor
    \PassOptionsToClass{zihao=5}{ctexbook}
  \else
    \PassOptionsToClass{zihao=-4}{ctexbook}
    \ifsjtu@master\relax\else
      \ifsjtu@doctor\relax\else
        \ClassError{sjtuthesis}%
          {You have to specify one of thesis options: coursepaper, bachelor, master or doctor.}{}
      \fi
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

%% sjtuthesis.cls segments
% 0. Import sjtuthesis.cfg & define variables
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands.
% 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
% 4. Draw the sjtuthesis

%==========
% Segment 0. Import sjtuthesis.cfg & define variables
%==========

\AtEndOfClass{\input{sjtuthesis.cfg}}

% Chinese variables
\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\sjtu@value@chinesedegree{#1}}
\renewcommand\title[1]{%
  \def\sjtu@value@chinesetitle{\sjtu@title@handler{#1}}%
  \def\sjtu@value@chinesecovertitle{\sjtu@covertitle@handler{#1}}}
\renewcommand\author[1]{\def\sjtu@value@author{#1}}
\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\sjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\coursename[1]{\def\sjtu@value@coursename{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}
\newcommand\keywords[1]{\def\sjtu@value@keywords{#1}}
\newcommand\cnacademicdegree[1]{\def\sjtu@value@cnacademicdegree{#1}}

% English variables
\newcommand\englishtitle[1]{\def\sjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\sjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\sjtu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\sjtu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\sjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\sjtu@value@englishinstitute{#1}}
\newcommand\englishinstitutemaster[1]{\def\sjtu@value@englishinstitutemaster{#1}}
\newcommand\englishdate[1]{\def\sjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\sjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\sjtu@value@englishmajor{#1}}
\newcommand\englishstudentid[1]{\def\sjtu@value@englishstudentid{#1}}
\newcommand\englishkeywords[1]{\def\sjtu@value@englishkeywords{#1}}
\newcommand\enacademicdegree[1]{\def\sjtu@value@enacademicdegree{#1}}

%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage{etoolbox}
\RequirePackage{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage[titles]{tocloft}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[opentype]{sourcecodepro}
\RequirePackage{upgreek}
\RequirePackage{wasysym}
\RequirePackage{anyfontsize}
\RequirePackage{metalogo,doc}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{makecell}
\usetikzlibrary{shapes.geometric, arrows}

% Make hyperref to set PDF metadata (author, title, subject, keywords)
\AtBeginDocument{
  \hypersetup{
    bookmarksnumbered,
    colorlinks,
    urlcolor=black,
    linkcolor=black,
    citecolor=black,
    plainpages=false,
    pdfstartview=FitH,
    pdfauthor={\sjtu@value@author},
    pdftitle={\sjtu@value@chinesetitle},
    pdfsubject={\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis},
    pdfkeywords={\sjtu@value@keywords},
  }
}
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{%
  \let\\\@empty%
  \let\sjtu@title@handler\@empty}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========
\geometry{
  paper      = a4paper,
  top        = 3.5cm,
  bottom     = 4.0cm,
  left       = 3.3cm,
  right      = 2.8cm,
}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
\renewcommand{\cftchapfont}{\bfseries\heiti}  % 目录章节标题（黑体加粗）

% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% E-mail
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

% upper math letter
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

% patch commands
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}
\patchcmd\@chapter
  {\if@twocolumn}
  {\addtocontents{loa}{\protect\addvspace{10\p@}}%
   \if@twocolumn}
  {}{}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX}

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
%==========

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{%
  contentsname   = \sjtu@contentsname,
  listfigurename = \sjtu@listfigurename,
  listtablename  = \sjtu@listtablename,
  autoindent     = true,
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={%
    format       = \normalsize\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}

\floatname{algorithm}{\sjtu@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{\sjtu@algorithmicrequire}}
\renewcommand{\algorithmicensure}{\textbf{\sjtu@algorithmicensure}}
\renewcommand{\listalgorithmname}{\sjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\sjtu@value@listingname}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in caption and bicaption pacakge
\DeclareCaptionFont{kaishu}{\kaishu}
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,kaishu}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}

\DeclareCaptionOption{bi-first}[]{%
    \def\tablename{\sjtu@tablename}
    \def\figurename{\sjtu@figurename}
}
\DeclareCaptionOption{bi-second}[]{%
    \def\tablename{Table}
    \def\figurename{Figure}
}

% Set fontnote font size in threeparttable
\appto\TPTnoteSettings{\footnotesize}

% Ref https://github.com/sjtug/SJTUThesis/issues/186
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
  \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  \renewcommand{\thelstlisting}{\thechapter--\arabic{lstlisting}}
}

% 图表索引前加下“图”，“表”关键词
\ifsjtu@master
  \renewcommand*\cftfigpresnum{\sjtu@figurename~}
  % \newlength{\sjtu@cftfignumwidth@tmp}
  % \settowidth{\sjtu@cftfignumwidth@tmp}{\cftfigpresnum}
  % \addtolength{\cftfignumwidth}{\sjtu@cftfignumwidth@tmp}
  \renewcommand{\cftfigaftersnumb}{\enspace~}
  \renewcommand*\cfttabpresnum{\sjtu@tablename~}
  % \newlength{\sjtu@cfttabnumwidth@tmp}
  % \settowidth{\sjtu@cfttabnumwidth@tmp}{\cfttabpresnum}
  % \addtolength{\cfttabnumwidth}{\sjtu@cfttabnumwidth@tmp}
  \renewcommand{\cfttabaftersnumb}{\enspace~}
\fi
% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
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
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em,
  % 改变双引号和单引号的样式
  literate={"}{\textquotedbl}1,
  upquote=true
}

% Setting Package siunitx
\sisetup{detect-all} % Detecting fonts

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\sjtu@label@algo~}[chapter]
  \newtheorem{thm}{\sjtu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\sjtu@label@lem~}
  \newtheorem{prop}[thm]{\sjtu@label@prop~}
  \newtheorem{cor}[thm]{\sjtu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\sjtu@label@defn~}[chapter]
  \newtheorem{conj}{\sjtu@label@conj~}[chapter]
  \newtheorem{exmp}{\sjtu@label@exmp~}[chapter]
  \newtheorem{rem}{\sjtu@label@rem~}
  \newtheorem{case}{\sjtu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\sjtu@label@thm~}
  \newtheorem{blem}[thm]{\sjtu@label@lem~}
  \newtheorem{bprop}[thm]{\sjtu@label@prop~}
  \newtheorem{bcor}[thm]{\sjtu@label@cor~}
  \renewcommand{\proofname}{\bfseries\sjtu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the sjtuthesis
%==========

\renewcommand\maketitle{%
  \pdfbookmark[0]{\sjtu@titlepage}{titlepage}
  \ifsjtu@coursepaper
    \makechinesetitle@coursepaper
  \else
    \ifsjtu@bachelor
      \makechinesetitle@bachelor
    \else
      \ifsjtu@master
        \makechinesetitle@master
        \makeenglishtitle@master
      \else
        \makechinesetitle
        \makeenglishtitle
      \fi
    \fi
  \fi
}

\ExplSyntaxOn
\tl_new:N        \l__sjtu_tmp_tl
\seq_new:N       \l__sjtu_tmp_seq
\NewDocumentCommand{ \sjtu@covertitle@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__sjtu_tmp_seq { #1 } { #2 }
    \seq_pop_right:NN  \l__sjtu_tmp_seq \l__sjtu_tmp_tl
    \seq_map_inline:Nn \l__sjtu_tmp_seq { \underline { \makebox [ 300pt ] { ##1 } } \\ }
    \underline { \makebox [ 300pt ] { \l__sjtu_tmp_tl } }
  }
\NewDocumentCommand{ \sjtu@title@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__sjtu_tmp_seq { #1 } { #2 }
    \seq_map_inline:Nn \l__sjtu_tmp_seq { ##1 }
  }
\ExplSyntaxOff

% “绘制”硕士论文模板中文标题页
\newcommand\makechinesetitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-2} ~\\[35pt] \sjtu@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{2}\sjtu@value@chinesetitle}
  \vskip\stretch{1.2}
  {\fangsong\zihao{4}}
  \zihao{4}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.25}
  \begin{tabular}{>{\begin{CJKfilltwosides}[t]{7\ccwd}\heiti }r<{\end{CJKfilltwosides}}l}
    \ifsjtu@review
      \sjtu@label@author        & \enspace ~ \\
      \sjtu@label@studentnumber & \enspace ~ \\
      \sjtu@label@advisor       & \enspace ~ \\
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     & \enspace ~ \\
      \fi
    \else
      \sjtu@label@author        & \enspace {\sjtu@value@author} \\
      \sjtu@label@studentnumber & \enspace {\sjtu@value@studentnumber} \\
      \sjtu@label@advisor       & \enspace {\sjtu@value@advisor} \\
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     & \enspace {\sjtu@value@coadvisor} \\
      \fi
    \fi
      \sjtu@label@cnacademicdegree & \enspace {\sjtu@value@cnacademicdegree } \\
      \sjtu@label@major         & \enspace {\sjtu@value@major} \\
      \sjtu@label@institute         & \enspace {\sjtu@value@institute} \\
      \sjtu@label@defenddate    & \enspace {\sjtu@value@defenddate} \\
      \sjtu@label@school        & \enspace {\sjtu@value@school}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.25}
  \cleardoublepage
}
% “绘制”硕士论文模板英文标题页
\newcommand\makeenglishtitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{-2} ~\\[35pt] \sjtu@label@englishstatement}
      \vskip\stretch{1}
      {\zihao{2} \textbf{\MakeUppercase{\sjtu@value@englishtitle}} \vskip 1pt}
      \vskip \stretch{1}
      {\normalfont\zihao{4}}
      \zihao{4}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{ll}
        \ifsjtu@review
          \textbf{\sjtu@label@englishauthor} & \enspace ~ \\
          \textbf{\sjtu@label@englishstudentid} & \enspace ~ \\
          \textbf{\sjtu@label@englishadvisor}       & \enspace ~ \\
          \ifx\sjtu@value@englishcoadvisor\undefined\else
            \textbf{\sjtu@label@englishcoadvisor}     & \enspace ~ \\
          \fi
        \else
          \textbf{\sjtu@label@englishauthor} & \enspace \sjtu@value@englishauthor \\
          \textbf{\sjtu@label@englishstudentid} & \enspace \sjtu@value@englishstudentid \\
          \textbf{\sjtu@label@englishadvisor}      & \enspace \sjtu@value@englishadvisor \\
          \ifx\sjtu@value@englishcoadvisor\undefined\else
            \textbf{\sjtu@label@englishcoadvisor}    & \enspace \sjtu@value@englishcoadvisor \\
          \fi
        \fi
        \textbf{\sjtu@label@enacademicdegree}   & \enspace \sjtu@value@enacademicdegree \\
        \textbf{\sjtu@label@englishmajor}         & \enspace \sjtu@value@englishmajor \\
        \textbf{\sjtu@label@englishinstitutemaster}        & \enspace \makecell[l]{\sjtu@value@englishinstitutemaster} \\
        \textbf{\sjtu@label@englishdate}    & \enspace \sjtu@value@englishdate \\
        \textbf{\sjtu@label@englishschool}        & \enspace \sjtu@value@englishschool
      \end{tabular}
  \end{center}
  \vskip \stretch{0.4}
  \cleardoublepage
}

% “绘制”中文标题页
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\zihao{-3}\sjtu@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{3}\sjtu@value@chinesetitle}
  \vskip\stretch{1}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}\heiti}r<{\end{CJKfilltwosides}}@{：}c}
    \ifsjtu@review
      \sjtu@label@author        &  \\ \cline{2-2}
      \sjtu@label@studentnumber & \makebox[150pt]{} \\ \cline{2-2}
      \sjtu@label@advisor       &  \\ \cline{2-2}
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     &  \\ \cline{2-2}
      \fi
    \else
      \sjtu@label@author        & \sjtu@value@author \\ \cline{2-2}
      \sjtu@label@studentnumber & \makebox[150pt]{\sjtu@value@studentnumber} \\ \cline{2-2}
      \sjtu@label@advisor       & \sjtu@value@advisor \\ \cline{2-2}
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     & \sjtu@value@coadvisor \\ \cline{2-2}
      \fi
    \fi
    \sjtu@label@major         & \sjtu@value@major \\ \cline{2-2}
    \sjtu@label@defenddate    & \sjtu@value@defenddate \\ \cline{2-2}
  \end{tabular}
  \vskip 30pt
  \end{center}
  \cleardoublepage
}

% “绘制”英文标题页
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \sjtu@label@englishstatement}
      \vspace{20pt} \vskip\stretch{1}
      {\huge\sjtu@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \ifsjtu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\sjtu@value@englishauthor}
      \vskip \stretch{1}
      {\normalfont\zihao{4}\sjtu@label@englishadvisor}
      \vskip 2pt
      {\normalfont\zihao{4}\sjtu@value@englishadvisor}
      \vskip 5pt
      \ifx\sjtu@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\sjtu@label@englishcoadvisor}
        \vskip 2pt
        {\normalfont\zihao{4}\sjtu@value@englishcoadvisor}
        \vskip \stretch{2}
      \fi
    \fi
    \normalfont\sjtu@value@englishinstitute \vskip 30pt
    \normalfont\sjtu@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% “绘制”学士论文中文标题页
\newcommand\makechinesetitle@bachelor{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{sjtulogo}
    \vskip 30pt
    {\fontsize{32}{32}\sjtu@value@chinesedegree\sjtu@label@thesis}
    \vskip 15pt
    {\zihao{-2}\MakeUppercase{Thesis of \sjtu@value@englishdegree}}
    \vskip 15pt
    \includegraphics{sjtubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \sjtu@label@title & {\zihao{-2}\parbox[t]{320pt}{\sjtu@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
        \ifsjtu@review
          \sjtu@label@author        &  \\ \cline{2-2}
          \sjtu@label@studentnumber & \makebox[180pt]{} \\ \cline{2-2}
        \else
          \sjtu@label@author        & \sjtu@value@author \\ \cline{2-2}
          \sjtu@label@studentnumber & \makebox[180pt]{\sjtu@value@studentnumber} \\ \cline{2-2}
        \fi
          \sjtu@label@major         & \sjtu@value@major \\ \cline{2-2}
        \ifsjtu@review
          \sjtu@label@advisor       &  \\ \cline{2-2}
        \else
          \sjtu@label@advisor       & \sjtu@value@advisor \\ \cline{2-2}
        \fi
        \sjtu@label@institute     & \sjtu@value@institute \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% “绘制”课程论文标题页
\newcommand\makechinesetitle@coursepaper{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{sjtulogo}
    \vskip 30pt
    {\fontsize{32}{32}\sjtu@label@coursepaper}
    \vskip 15pt
    \includegraphics{sjtubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \sjtu@label@title & {\zihao{-2}\parbox[t]{320pt}{\sjtu@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
      \sjtu@label@coursename    & \sjtu@value@coursename \\ \cline{2-2}
      \sjtu@label@author        & \sjtu@value@author \\ \cline{2-2}
      \sjtu@label@studentnumber & \makebox[180pt]{\sjtu@value@studentnumber} \\ \cline{2-2}
      \sjtu@label@institute     & \sjtu@value@institute \\ \cline{2-2}
      \sjtu@label@major         & \sjtu@value@major \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    ~\\[70pt]
    % \linespread{1.5}
    {\zihao{-2}\heiti \textbf{\sjtu@value@school}} \\[12pt]
    {\zihao{-2}\heiti \textbf{\sjtu@label@original}} \\[12pt]
  \end{center}
  \vskip 10pt
  {\par\linespread{2}\zihao{4}本人郑重声明：所呈交的学位论文《\sjtu@value@chinesetitle》，\sjtu@label@originalcontent\par}
  \vskip 80pt
  {\zihao{4}\hspace{13em}\sjtu@label@authorsign\hrulefill\hspace{1.5em}}
  \vskip 40pt
  {\zihao{4}\hspace{11em}\sjtu@label@originalDate\hspace{1em}}
  \cleardoublepage
}

% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    ~\\[30pt]
    {\zihao{-2}\bfseries\heiti \sjtu@value@school} \\[12pt]
    {\zihao{-2}\bfseries\heiti \sjtu@label@authorization} \\[12pt]
  \end{center}
  \vskip 10pt
  {\par\linespread{1.5}\zihao{4}\sjtu@label@authorizationcontent\par}
  \vskip 150pt
  {\zihao{4} \sjtu@label@authorsign\hrulefill\hspace{3em}\sjtu@label@Supervisorsign\hrulefill}
  \vskip 40pt
  {\zihao{4} \sjtu@label@originalDate\hfill\hspace{3em}\sjtu@label@originalDate}
  \cleardoublepage
}

% fancyhdr页眉页脚设置
\ifsjtu@english
  \def\sjtu@value@titlemark{\sjtu@value@englishtitle}
  \newcommand\sjtu@fancyhead{\footnotesize\kaishu}
  \newcommand\sjtu@fancyfoot[2]{\small --~~Page~~{\bfseries{#1}}~~of~~{\bfseries{#2}}~~--}
\else
  \def\sjtu@value@titlemark{\sjtu@value@chinesetitle}
  \newcommand\sjtu@fancyhead{\small\kaishu}
  \newcommand\sjtu@fancyfoot[2]{\small 第~{\bfseries{#1}}~页\,共~{\bfseries{#2}}~页}
\fi
\def\markboxwidth{0.75\textwidth}
\AtBeginDocument{\pagenumbering{Alph}}

\ifsjtu@coursepaper
  %% 本科学位论文页眉页脚设置
  %% 前言页眉页脚
  \fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
    \renewcommand{\headheight}{32pt}
  }
  %% 正文页眉页脚
  \fancypagestyle{main}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
    \renewcommand{\headheight}{32pt}
  }
\else
  \ifsjtu@bachelor
  %% 本科学位论文页眉页脚设置
    %% 前言页眉页脚
    \fancypagestyle{front}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/sjtubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
      \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 正文页眉页脚
    \fancypagestyle{main}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/sjtubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
      \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 英文大摘要
    \fancypagestyle{biglast}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/sjtubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
      \fancyfoot[C]{\sjtu@fancyfoot{\theCurrentPageLocal}{\lastpageref{pagesLTS.roman.local}}}
      \renewcommand{\headheight}{32pt}
    }
  \else
  %% 研究生学位论文页眉页脚设置
    \if@twoside
    %% 双面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\sjtu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\sjtu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \else
    %% 单面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
        \fancyhead[R]{\nouppercase{\sjtu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
        \fancyhead[R]{\nouppercase{\sjtu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \fi
  \fi
\fi

\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifsjtu@coursepaper
    \pagestyle{front}
  \else
    \ifsjtu@bachelor
      \pagestyle{front}
    \else
      \pagestyle{main}
    \fi
  \fi
  \pagenumbering{Roman}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}

% 中英文摘要+关键词
\newenvironment{abstract}{%
  \cleardoublepage
  \pdfbookmark[0]{\sjtu@label@abstract}{abstract}
  \ifsjtu@bachelor
    \chapter*{%
      {\zihao{3} \sjtu@value@chinesetitle}
      \vskip 20pt
      {\zihao{4} \sjtu@label@chineseabstract}
    }
    \zihao{5} \markboth{\sjtu@label@chineseabstract}{}
  \else
    \chapter*{%
      \sjtu@value@chinesetitle
      \vskip 20pt
      \sjtu@label@chineseabstract
    }
    \zihao{4} \markboth{\sjtu@label@chineseabstract}{}
  \fi
}{
  \vspace{2ex}\noindent
  \ifsjtu@bachelor
    {\zihao{-4} \textbf{\sjtu@label@keywords}}{\zihao{5}{\sjtu@value@keywords}}
  \else
    {\zihao{4} \textbf{\sjtu@label@keywords}{\sjtu@value@keywords}}
  \fi
}
\newenvironment{englishabstract}{%
  \cleardoublepage
  \ifsjtu@bachelor
    \chapter*{%
      {\zihao{3} \MakeUppercase\sjtu@value@englishtitle}
      \vskip 20pt
      {\zihao{4} \MakeUppercase\sjtu@label@englishabstract}
    }
    \zihao{5} \markboth{\sjtu@label@englishabstract}{}
  \else
    \chapter*{%
      \MakeUppercase\sjtu@value@englishtitle
      \vskip 20pt
      \MakeUppercase\sjtu@label@englishabstract
    }
    \zihao{4} \markboth{\sjtu@label@englishabstract}{}
  \fi
}{
  \vspace{2ex}\noindent
  \ifsjtu@bachelor
    {\zihao{-4} \textbf{\sjtu@label@englishkeywords}}{\zihao{5} \sjtu@value@englishkeywords}
  \else
    {\zihao{4} \textbf{\sjtu@label@englishkeywords}{\sjtu@value@englishkeywords}}
  \fi
}

% 主要符号对照表
\newenvironment{nomenclaturename}{\cleardoublepage
\chapter{\sjtu@nomenclature}{}}{}

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

\newenvironment{patents}[1]
     {\chapter{\sjtu@label@patents}%
      \@mkboth{\MakeUppercase\sjtu@label@patents}
              {\MakeUppercase\sjtu@label@patents}%
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
       {\@latex@warning{Empty `patents' environment}}%
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

\newenvironment{resume}%
  {\chapter{\sjtu@label@resume}}%
  {}

\newenvironment{resumesection}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}%
  {\endlist}

\newenvironment{resumelist}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}}%
  {\endlist}

\renewenvironment{thanks}{%
  \chapter*{%
    \sjtu@label@thanks
    \markboth{\sjtu@label@thanks}{}
  }
  \addcontentsline{toc}{chapter}{\sjtu@label@thanks}
}{}

\newenvironment{summary}{%
  \chapter*{%
    \sjtu@label@summary
    \markboth{\sjtu@label@summary}{}
  }
  \addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{}

\newenvironment{bigabstract}{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{biglast}
  \chapter*{%
    \bfseries
    \MakeUppercase\sjtu@value@englishtitle
    \vskip 20pt
  }
}{\cleardoublepage}

\endinput

%%
%% End of file `sjtuthesis.cls'.
