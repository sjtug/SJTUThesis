%# -*- coding: utf-8-unix -*-
%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis}[2017/02/19 v0.9.5 Shanghai Jiao Tong University Template]
\def\version{v0.9.5}
\newif\ifsjtu@bachelor\sjtu@bachelorfalse
\newif\ifsjtu@master\sjtu@masterfalse
\newif\ifsjtu@doctor\sjtu@doctorfalse
\newif\ifsjtu@english\sjtu@englishfalse
\newif\ifsjtu@review\sjtu@reviewfalse
\newif\ifsjtu@submit\sjtu@submitfalse
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
\ifsjtu@bachelor
  \PassOptionsToClass{zihao=5}{ctexbook}
\else
  \PassOptionsToClass{zihao=-4}{ctexbook}
  \ifsjtu@master\relax\else
    \ifsjtu@doctor\relax\else
      \ClassError{sjtuthesis}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

%% sjtuthesis.cls segments
% 0. Import sjtuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
% 4. Draw the sjtuthesis

%==========
% Segment 0. Import sjtuthesis.cfg 
%==========

%% 导入 sjtuthesis.cfg 文件
\AtEndOfClass{\input{sjtuthesis.cfg}}

%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{sourcecodepro}
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
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

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
\ctexset{contentsname={\sjtu@contentsname}}
\ctexset{listfigurename={\sjtu@listfigurename}}
\ctexset{listtablename={\sjtu@listtablename}}
\floatname{algorithm}{\sjtu@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{\sjtu@algorithmicrequire}} 
\renewcommand{\algorithmicensure}{\textbf{\sjtu@algorithmicensure}}
\renewcommand{\listalgorithmname}{\sjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\sjtu@value@listingname}

% Title Settings at the chapter Level
\ctexset{chapter={
	format={\centering},
	nameformat={\Large\bfseries},
	titleformat={\Large\bfseries},
	aftername={\quad},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}
% Title Settings at the section Level
\ctexset{section={
	format={\large\bfseries},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
	format={\bfseries\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

% Set indent in English mode
\ifsjtu@english\setlength{\parindent}{2\ccwd}\fi

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

\DeclareCaptionOption{bi-first}[]{
    \def\tablename{\sjtu@tablename}
    \def\figurename{\sjtu@figurename}
}
\DeclareCaptionOption{bi-second}[]{
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
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}
\AtBeginDocument{\renewcommand{\thelstlisting}{\arabic{chapter}--\arabic{lstlisting}}}

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
  numbersep=-1em
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
  \ifsjtu@bachelor
    \makechinesetitle@bachelor
  \else
    \makechinesetitle
    \makeenglishtitle
  \fi
}

\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\sjtu@value@chinesedegree{#1}}
\renewcommand\title[1]{\def\sjtu@value@chinesetitle{#1}}
\renewcommand\author[1]{\def\sjtu@value@author{#1}}
\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\sjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}

% “绘制”中文标题页
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-3}\sjtu@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{3}\sjtu@value@chinesetitle}
  \vskip\stretch{1}
  {\fangsong\zihao{4}}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}\heiti}r<{\end{CJKfilltwosides}}l}
    \ifsjtu@review
      \sjtu@label@author        & \underline{\makebox[150pt]{}} \\
      \sjtu@label@studentnumber & \underline{\makebox[150pt]{}} \\
      \sjtu@label@advisor       & \underline{\makebox[150pt]{}} \\ 
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     & \underline{\makebox[150pt]{}} \\ 
      \fi
    \else
      \sjtu@label@author        & \underline{\makebox[150pt]{\sjtu@value@author}} \\
      \sjtu@label@studentnumber & \underline{\makebox[150pt]{\sjtu@value@studentnumber}} \\
      \sjtu@label@advisor       & \underline{\makebox[150pt]{\sjtu@value@advisor}} \\ 
      \ifx\sjtu@value@coadvisor\undefined\else
        \sjtu@label@coadvisor     & \underline{\makebox[150pt]{\sjtu@value@coadvisor}} \\ 
      \fi
    \fi
      \sjtu@label@major         & \underline{\makebox[150pt]{\sjtu@value@major}} \\
      \sjtu@label@defenddate    & \underline{\makebox[150pt]{\sjtu@value@defenddate}}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \cleardoublepage
}

% English Title Page
\newcommand\englishtitle[1]{\def\sjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\sjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\sjtu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\sjtu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\sjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\sjtu@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\sjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\sjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\sjtu@value@englishmajor{#1}}

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
    \vspace*{20pt} \vskip 7pt
    \includegraphics{sjtulogo}
    \vskip 30pt
    {\fontsize{32}{32}\kaishu\sjtu@value@chinesedegree\sjtu@label@thesis}
    \vskip 15pt
    {\zihao{-2}\MakeUppercase{Thesis of \sjtu@value@englishdegree}}
    \vskip 15pt
    \includegraphics{sjtubadge}
    \vskip \stretch{2}
    {\kaishu\zihao{2}
    \begin{tabular}{r@{：}l}
      \sjtu@label@title &
      {\zihao{-2}\underline{\begin{minipage}{360pt}\centering\sjtu@value@chinesetitle\end{minipage}}}
    \end{tabular}}
    \vskip \stretch{1}
    {\kaishu\zihao{3}
    \def\arraystretch{1.1}
    \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}l}
      \ifsjtu@review
        \sjtu@label@author        & \underline{\makebox[180pt]{}} \\
        \sjtu@label@studentnumber & \underline{\makebox[180pt]{}} \\
      \else
        \sjtu@label@author        & \underline{\makebox[180pt]{\sjtu@value@author}} \\
        \sjtu@label@studentnumber & \underline{\makebox[180pt]{\sjtu@value@studentnumber}} \\
      \fi
        \sjtu@label@major         & \underline{\makebox[180pt]{\sjtu@value@major}} \\
      \ifsjtu@review
        \sjtu@label@advisor       & \underline{\makebox[180pt]{}} \\
      \else
        \sjtu@label@advisor       & \underline{\makebox[180pt]{\sjtu@value@advisor}} \\
      \fi
        \sjtu@label@institute     & \underline{\makebox[180pt]{\sjtu@value@institute}}
    \end{tabular}}
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bfseries\zihao{3} \sjtu@value@school}\\
  	{\bfseries\zihao{3} \sjtu@label@original}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@originalcontent\par}
  \vskip 60pt
  \hspace{13em}\sjtu@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\sjtu@label@originalDate\hspace{1em}
  \cleardoublepage
}

% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bfseries\zihao{3} \sjtu@value@school}\\
  	{\bfseries\zihao{3} \sjtu@label@authorization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@authorizationcontent\par}
  \vskip 60pt
  \sjtu@label@authorsign\hrulefill\hspace{3em}\sjtu@label@Supervisorsign\hrulefill
  \vskip 15pt
  \sjtu@label@originalDate\hfill\hspace{3em}\sjtu@label@originalDate
  \cleardoublepage
}

% fancyhdr页眉页脚设置
\ifsjtu@english
  \def\sjtu@value@titlemark{\sjtu@value@englishtitle}
  \newcommand\sjtu@fancyhead{\footnotesize\kaishu}
  \newcommand\sjtu@fancyfoot[1]{\small --~~{\bfseries\thepage}~~of~~{\bfseries{#1}}~~--}
\else
  \def\sjtu@value@titlemark{\sjtu@value@chinesetitle}
  \newcommand\sjtu@fancyhead{\small\kaishu}
  \newcommand\sjtu@fancyfoot[1]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries{#1}}~页}
\fi
\def\markboxwidth{0.75\textwidth}
\ifsjtu@bachelor
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics{figure/sjtubanner}}
	  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
	  \fancyfoot[C]{\sjtu@fancyfoot{\pageref{last}}}
	  \renewcommand{\headheight}{32pt}
	}
  %% 英文大摘要
  \fancypagestyle{biglast}{
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]{\sjtu@fancyfoot{\pageref{biglast}}}
    \renewcommand{\headheight}{32pt}
  }
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics{figure/sjtubanner}}
	  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
	  \fancyfoot[C]{\sjtu@fancyfoot{\pageref{last}}}
	  \renewcommand{\headheight}{32pt}
	}
\else
	% 研究生学位论文页眉页脚设置
	\if@twoside
	  %% 正文页眉页脚
	  \fancypagestyle{main}{
	    \fancyhf{}
	    \fancyhead[LO,RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	    \fancyhead[LE,RO]{\nouppercase{\sjtu@fancyhead\leftmark}}
	    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	  %% 开章页页眉页脚
	  \fancypagestyle{plain}{
	    \fancyhf{}
	    \fancyhead[LO,RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	    \fancyhead[LE,RO]{\nouppercase{\sjtu@fancyhead\leftmark}}
	    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	\else
	%% 正文页
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	  \fancyhead[R]{\nouppercase{\sjtu@fancyhead\leftmark}}
	  \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	  \fancyhead[R]{\nouppercase{\sjtu@fancyhead\leftmark}}
	  \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fi
\fi

% 中英文摘要
\newenvironment{abstract}{\cleardoublepage \pdfbookmark[0]{\sjtu@label@abstract}{abstract} \ifsjtu@english\let\@afterindentfalse\relax\fi
\chapter*{\sjtu@value@chinesetitle\vskip 20pt\sjtu@label@chineseabstract}\markboth{\sjtu@label@chineseabstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\large \sjtu@label@keywords} #1}
\newenvironment{englishabstract}{\cleardoublepage
\chapter*{\MakeUppercase\sjtu@value@englishtitle\vskip 20pt\bfseries \MakeUppercase\sjtu@label@englishabstract}\markboth{\sjtu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bfseries\large \sjtu@label@englishkeywords} #1}

% 主要符号对照表
\newenvironment{nomenclaturename}{\cleardoublepage
\chapter{\sjtu@nomenclature}{}}{}

\renewcommand\tableofcontents{%
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{toc}
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

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
  {\chapter{\sjtu@label@thanks}\label{last}}
  {}

\newenvironment{summary}
{\chapter*{\sjtu@label@summary\markboth{\sjtu@label@summary}{}}\addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{}

\newenvironment{symbolnote}{\chapter{\sjtu@label@symbolnote}
}{}

\newenvironment{bigabstract}
{
\setcounter{page}{1}
\fancypagestyle{biglast}{
  \fancyhf{}
  \fancyhead[L]{\includegraphics{figure/sjtubanner}}
  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
  \fancyfoot[C]{\sjtu@fancyfoot{\pageref{biglast}}}
  \renewcommand{\headheight}{32pt}
}

\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}
  \fancyhead[L]{\includegraphics{figure/sjtubanner}}
  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
  \fancyfoot[C]{\sjtu@fancyfoot{\pageref{biglast}}}
  \renewcommand{\headheight}{32pt}
}

\chapter*{\bfseries\MakeUppercase{\sjtu@value@englishtitle}\vskip 20pt }
}
{\label{biglast}}

\endinput

%%
%% End of file `sjtuthesis.cls'.
