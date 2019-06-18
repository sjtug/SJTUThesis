%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2019 by SJTUG
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%     https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Alexara Wu.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sjtuthesis}
  [2019/06/16 1.0.0rc Shanghai Jiao Tong University Thesis Template]
\hyphenation{SJTU-Thesis}
\def\sjtuthesis{SJTUThesis}
\def\version{1.0.0rc}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\DeclareStringOption[doctor]{degree}[doctor]
\DeclareStringOption[chinese]{language}[chinese]
\DeclareStringOption[gb7714-2015]{bibstyle}[gb7714-2015]
\DeclareStringOption[5]{zihao}[5]
\DeclareBoolOption{review}
\DeclareBoolOption{unsetfont}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newcommand{\sjtu@validate@key}[1]{%
  \@ifundefined{sjtu@\csname sjtu@#1\endcsname true}{%
    \ClassError{sjtuthesis}{Invalid value '\csname sjtu@#1\endcsname'}{}%
  }{%
    \csname sjtu@\csname sjtu@#1\endcsname true\endcsname
  }%
}
\newif\ifsjtu@course
\newif\ifsjtu@bachelor
\newif\ifsjtu@master
\newif\ifsjtu@doctor
\sjtu@validate@key{degree}
\ifsjtu@course\sjtu@bachelortrue\fi
\ifsjtu@doctor\sjtu@mastertrue\fi
\newif\ifsjtu@chinese
\newif\ifsjtu@english
\sjtu@validate@key{language}
\ifsjtu@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,zihao=\sjtu@zihao,linespread=1.3,UTF8]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{mathtools}
\ifsjtu@unsetfont\relax\else%
  \RequirePackage[defaultsups]{newtxtext}
  \RequirePackage{newtxmath}
  \RequirePackage[opentype]{sourcecodepro}
\fi
\RequirePackage{anyfontsize}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=\sjtu@bibstyle]{biblatex}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{hyperref}
\newcommand{\sjtu@def@term}[1]{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname sjtu@value@#1\endcsname{##1}}
  \csname #1\endcsname{}
  \define@key{sjtuvalue}{#1}{\csname #1\endcsname{##1}}}
\sjtu@def@term{title}
\sjtu@def@term{entitle}
\sjtu@def@term{keywords}
\sjtu@def@term{enkeywords}
\sjtu@def@term{author}
\sjtu@def@term{supervisor}
\sjtu@def@term{assisupervisor}
\sjtu@def@term{enauthor}
\sjtu@def@term{ensupervisor}
\sjtu@def@term{enassisupervisor}
\sjtu@def@term{studentid}
\sjtu@def@term{degree}
\sjtu@def@term{endegree}
\sjtu@def@term{department}
\sjtu@def@term{endepartment}
\sjtu@def@term{major}
\sjtu@def@term{enmajor}
\sjtu@def@term{coursename}
\sjtu@def@term{encoursename}
\sjtu@def@term{fund}
\sjtu@def@term{enfund}
\sjtu@def@term{date}
\sjtu@def@term{endate}
\NewDocumentCommand\sjtuSetInfo{}{\setkeys{sjtuvalue}}
\newcommand{\sjtu@def@label}[2]{%
  \expandafter\gdef\csname sjtu@label@#1\endcsname{#2}
  \define@key{sjtulabel}{#1}{%
    \expandafter\gdef\csname sjtu@label@#1\endcsname{##1}}}
\sjtu@def@label{schoolChi}{上海交通大学}
\sjtu@def@label{schoolEng}{Shanghai Jiao Tong University}
\sjtu@def@label{originalityChi}{原创性声明}
\sjtu@def@label{originalityEng}{Declaration of Originality}
\sjtu@def@label{authorizationChi}{版权使用授权书}
\sjtu@def@label{authorizationEng}{Declaration of Authorization}
\sjtu@def@label{origtitle}{\sjtu@label@thesistype\sjtu@label@originalityChi}
\sjtu@def@label{authtitle}{\sjtu@label@thesistype\sjtu@label@authorizationChi}
\sjtu@def@label{origbody}{%
  本人郑重声明：所呈交的\sjtu@label@thesistype ，是本人在导师的指导下，
  独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含
  任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献
  的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果
  由本人承担。}
\sjtu@def@label{authbody}{%
  本\sjtu@label@thesistype 作者完全了解学校有关保留、使用\sjtu@label@thesistype
  的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允
  许论文被查阅和借阅。本人授权上海交通大学可以将本\sjtu@label@thesistype
  的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制
  手段保存和汇编本\sjtu@label@thesistype 。}
\sjtu@def@label{abstractChi}{摘\quad 要}
\sjtu@def@label{abstractEng}{Abstract}
\sjtu@def@label{keywordsChi}{关键词：}
\sjtu@def@label{keywordsEng}{Key words:~}
\ifsjtu@english
  \sjtu@def@label{titlepage}{Title Page}
  \def\sjtu@label@originality{\sjtu@label@originalityEng}
  \def\sjtu@label@authorization{\sjtu@label@authorizationEng}
  \def\sjtu@label@abstract{\sjtu@label@abstractEng}
  \sjtu@def@label{contents}{Contents}
  \sjtu@def@label{figure}{Figure}
  \sjtu@def@label{listfigure}{List of Figures}
  \sjtu@def@label{table}{Table}
  \sjtu@def@label{listtable}{List of Tables}
  \sjtu@def@label{algorithm}{Algorithm}
  \sjtu@def@label{listalgorithm}{List of Algorithms}
  \sjtu@def@label{nomenclature}{Nomenclature}
  \sjtu@def@label{summary}{Summary}
  \sjtu@def@label{acknowledgements}{Acknowledgements}
  \sjtu@def@label{publications}{Publications}
  \sjtu@def@label{patents}{Patents}
  \sjtu@def@label{projects}{Projects}
  \sjtu@def@label{resume}{Resume}
\else
  \sjtu@def@label{titlepage}{扉页}
  \def\sjtu@label@originality{\sjtu@label@originalityChi}
  \def\sjtu@label@authorization{\sjtu@label@authorizationChi}
  \def\sjtu@label@abstract{\sjtu@label@abstractChi}
  \sjtu@def@label{contents}{目\quad 录}
  \sjtu@def@label{figure}{图}
  \sjtu@def@label{listfigure}{插图索引}
  \sjtu@def@label{table}{表}
  \sjtu@def@label{listtable}{表格索引}
  \sjtu@def@label{algorithm}{算法}
  \sjtu@def@label{listalgorithm}{算法索引}
  \sjtu@def@label{nomenclature}{主要符号对照表}
  \sjtu@def@label{summary}{全文总结}
  \sjtu@def@label{acknowledgements}{致\quad 谢}
  \sjtu@def@label{publications}%
                 {攻读\sjtu@label@degreetypeChi 学位期间已发表或录用的论文}
  \sjtu@def@label{patents}%
                 {攻读\sjtu@label@degreetypeChi 学位期间申请的专利}
  \sjtu@def@label{projects}%
                 {攻读\sjtu@label@degreetypeChi 学位期间参与的项目}
  \sjtu@def@label{resume}{简\quad 历}
\fi
\NewDocumentCommand\sjtuSetLabel{}{\setkeys{sjtulabel}}
\ctexset{%
  contentsname   = \sjtu@label@contents,
  listfigurename = \sjtu@label@listfigure,
  listtablename  = \sjtu@label@listtable}
\patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter%
  {\thispagestyle{\CTEX@chapter@pagestyle}}{}
  {}{}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}}
\ctexset{%
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = 1ex,
    afterskip    = 2ex
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsubsection={%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand{\tableofcontents}{%
  \cleardoublepage%
  \pdfbookmark[0]{\contentsname}{toc}%
  \chapter*{\contentsname}%
  \@mkboth{\contentsname}{\contentsname}%
  \@starttoc{toc}
}
\renewcommand{\listoffigures}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listfigurename}{lof}%
  \chapter*{\listfigurename}%
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}
}
\renewcommand{\listoftables}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listtablename}{lot}%
  \chapter*{\listtablename}%
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}
}
\renewcommand{\cftfigpresnum}{\sjtu@label@figure~}
\newlength{\sjtu@cftfignumwidth@tmp}
  \settowidth{\sjtu@cftfignumwidth@tmp}{\cftfigpresnum}
\addtolength{\cftfignumwidth}{\sjtu@cftfignumwidth@tmp}
\renewcommand{\cfttabpresnum}{\sjtu@label@table~}
\newlength{\sjtu@cfttabnumwidth@tmp}
  \settowidth{\sjtu@cfttabnumwidth@tmp}{\cfttabpresnum}
\addtolength{\cfttabnumwidth}{\sjtu@cfttabnumwidth@tmp}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand{\p@subfigure}{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}}
\DeclareCaptionFont{sjtucaptionfont}{\zihao{5}\kaishu}
\DeclareCaptionFont{sjtusubcaptionfont}{\zihao{-5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = sjtucaptionfont}
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{\sjtu@label@table}
  \def\figurename{\sjtu@label@figure}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{Table}
  \def\figurename{Figure}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=sjtusubcaptionfont}
\newcommand{\sjtu@square}{{\CJKfamily+{zhsong}\symbol{"25A1}}}
\newcommand{\sjtu@authconf}{%
  \par\hspace{7em}%
  {\heiti 保\quad 密}~\sjtu@square，在 \uline{\hspace{3em}}
  年解密后适用本授权书。\par
  本\sjtu@label@thesiscat 属于
  \par\hspace{7em}%
  {\heiti 不保密}~\sjtu@square。
  \vskip 1ex
  （请在以上方框内打“$\checkmark$”）
}
\newcommand{\sjtu@signbox}[1]{%
  \parbox{.45\textwidth}{%
    #1 签名： \vskip 4em%
    日期： \hspace{\stretch{3}} 年%
    \hspace{\stretch{2}} 月 \hspace{\stretch{2}} 日%
  }
}
\NewDocumentCommand{\makeDeclareOriginality}{o}{%
  \ifsjtu@review\relax\else%
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@label@originality}{origtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@label@schoolChi \\%
                \sjtu@label@origtitle}
      {\zihao{4}
        \sjtu@label@origbody
        \vskip16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \sjtu@signbox{\sjtu@label@thesiscat 作者}
        \end{minipage}}}
      {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}
\NewDocumentCommand{\makeDeclareAuthorization}{o}{%
  \ifsjtu@review\relax\else%
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@label@authorization}{authtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@label@schoolChi \\%
                \sjtu@label@authtitle}
      {\zihao{4}
        \sjtu@label@authbody
        \vskip1ex
        \sjtu@authconf
        \vskip16ex
        \noindent
        \begin{minipage}{\textwidth}
          \sjtu@signbox{\sjtu@label@thesiscat 作者}
          \hfill
          \sjtu@signbox{指导教师}
        \end{minipage}}}
      {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}
\NewDocumentEnvironment{nomenclature}{m}
{\cleardoublepage
  \pdfbookmark[0]{\sjtu@label@nomenclature}{nomenclature}
  \chapter*{\sjtu@label@nomenclature}
  \markboth{\sjtu@label@nomenclature}%
           {\sjtu@label@nomenclature}
  \begin{longtable}{#1}}
{\end{longtable}}
\NewDocumentEnvironment{summary}{}{%
  \cleardoublepage
  \chapter*{\sjtu@label@summary}
  \markboth{\sjtu@label@summary}%
           {\sjtu@label@summary}
  \addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{}
\newcommand{\sjtu@acknowledgements}[1]{\long\gdef\sjtu@acknowledgements@body{#1}}
\NewDocumentEnvironment{acknowledgements}{}
{\Collect@Body\sjtu@acknowledgements}
{\ifsjtu@review\relax\else%
    \cleardoublepage
    \chapter*{\sjtu@label@acknowledgements}
    \markboth{\sjtu@label@acknowledgements}%
             {\sjtu@label@acknowledgements}
    \addcontentsline{toc}{chapter}{\sjtu@label@acknowledgements}
    \sjtu@acknowledgements@body
  \fi}
\NewDocumentEnvironment{sjtu@bibliolist}{o}{%
  \list%
    {\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}
      \setlength{\labelsep}{\biblabelsep}%
      \setlength{\leftmargin}{\bibhang}%
      \addtolength{\leftmargin}{\labelwidth}%
      \setlength{\itemindent}{0pt}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}%
  \usecounter{enumiv}%
  \let\p@enumiv\@empty
  \renewcommand{\theenumiv}{\@arabic\c@enumiv}}
{\def\@noitemerr
  {\@latex@warning{Empty `bibliolist' environment}}%
  \endlist}
\NewDocumentEnvironment{publications}{O{99}}
{\cleardoublepage
  \chapter{\sjtu@label@publications}
  \markboth{\sjtu@label@publications}%
           {\sjtu@label@publications}
  \begin{sjtu@bibliolist}[#1]}
{\end{sjtu@bibliolist}}
\NewDocumentEnvironment{patents}{O{99}}
{\cleardoublepage
  \chapter{\sjtu@label@patents}
  \markboth{\sjtu@label@patents}%
           {\sjtu@label@patents}
  \begin{sjtu@bibliolist}[#1]}
{\end{sjtu@bibliolist}}
\NewDocumentEnvironment{projects}{O{99}}
{\cleardoublepage
  \chapter{\sjtu@label@projects}
  \markboth{\sjtu@label@projects}%
           {\sjtu@label@projects}
  \begin{sjtu@bibliolist}[#1]}
{\end{sjtu@bibliolist}}
\newcommand{\sjtu@resume}[1]{\long\gdef\sjtu@resume@body{#1}}
\NewDocumentEnvironment{resume}{}
{\Collect@Body\sjtu@resume}
{\ifsjtu@review\relax\else%
  \cleardoublepage
  \chapter{\sjtu@label@resume}
  \markboth{\sjtu@label@resume}%
           {\sjtu@label@resume}
  \sjtu@resume@body
\fi}
\AtBeginDocument{
  \ifsjtu@review%
    \sjtuSetInfo{%
      author={},
      supervisor={},
      assisupervisor={},
      enauthor={},
      ensupervisor={},
      enassisupervisor={},
      studentid={},
      date={},
      endate={}
    }
  \fi
  \hypersetup{%
    pdftitle    = \sjtu@value@title,
    pdfauthor   = \sjtu@value@author,
    pdfsubject  = \sjtu@label@subjectChi,
    pdfkeywords = \sjtu@value@keywords,
    pdfcreator  = {LaTeX with SJTUThesis \version}
  }%
}
\NewDocumentCommand{\encrypt}{m O{***}}{%
  \ifsjtu@review
    {#2}
  \else
    {#1}
  \fi
}
\newcommand{\sjtu@uline}[1]%
{\begingroup
  \setbox0=\vbox{\strut #1\strut}%
  \dimen0=0pt
  \loop\ifdim\ht0>0pt
    \dimen1=\dimexpr\ht0 - \baselineskip\relax
    \setbox1=\vsplit0 to \ht\strutbox
    \advance\dimen1 by -\ht0
    \noindent\raisebox{-\dimen0}[\ht\strutbox][\dp\strutbox]{\box1}%
    \advance\dimen0 by \dimen1
    \vspace{-0.2ex}\hrule\vskip 0.2ex
  \repeat
\endgroup}
\hypersetup{
  linktoc            = all,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  unicode            = true,
  psdextra           = true,
  breaklinks         = true,
  plainpages         = false,
  hidelinks,
}
\pdfstringdefDisableCommands{%
  \let\\\@empty
  \let\quad\@empty
  \let\hspace\@gobble
}
\urlstyle{same}
\def\UrlBreaks{%
  \do\/%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l%
     \do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L%
     \do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:%
  \do\*\do\-\do\~\do\'\do\"\do\-}
\Urlmuskip=0mu plus 0.1mu
\ifsjtu@bachelor%
  \AtEndOfClass{\input{sjtuthesis-bachelor.ltx}}
\else
  \ifsjtu@master%
    \AtEndOfClass{\input{sjtuthesis-graduate.ltx}}
  \fi
\fi
\newcommand{\sjtu@atendpackage}{\csname ctex_at_end_package:nn\endcsname}
\sjtu@atendpackage{unicode-math}{
  \unimathsetup{
    math-style = ISO,
    bold-style = ISO,
    nabla      = upright,
    partial    = upright,
  }
  \newcommand{\bm}{\symbf}
  \renewcommand{\boldsymbol}{\symbf}
  \newcommand{\square}{\mdlgwhtsquare}
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmugreek}%
  }
}
\sjtu@atendpackage{threeparttable}{
  \appto\TPTnoteSettings{\footnotesize}
}
\sjtu@atendpackage{siunitx}{
  \sisetup{
    detect-all,
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifsjtu@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\sjtu@atendpackage{ntheorem}{
  \ifsjtu@chinese
    \def\sjtu@label@assertion{断言}
    \def\sjtu@label@assumption{假设}
    \def\sjtu@label@axiom{公理}
    \def\sjtu@label@corollary{推论}
    \def\sjtu@label@definition{定义}
    \def\sjtu@label@example{例}
    \def\sjtu@label@lemma{引理}
    \def\sjtu@label@proof{证明}
    \def\sjtu@label@proposition{命题}
    \def\sjtu@label@remark{注}
    \def\sjtu@label@theorem{定理}
  \else
    \def\sjtu@label@assertion{Assertion}
    \def\sjtu@label@assumption{Assumption}
    \def\sjtu@label@axiom{Axiom}
    \def\sjtu@label@corollary{Corollary}
    \def\sjtu@label@definition{Definition}
    \def\sjtu@label@example{Example}
    \def\sjtu@label@lemma{Lemma}
    \def\sjtu@label@proof{Proof}
    \def\sjtu@label@proposition{Proposition}
    \def\sjtu@label@remark{Remark}
    \def\sjtu@label@theorem{Theorem}
  \fi
  \theorembodyfont{\normalfont}
  \theoremheaderfont{\bfseries\heiti}
  \theoremseparator{\enspace}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\sjtu@label@proof}
  \theoremstyle{plain}
  \theorembodyfont{\kaishu}
  \theoremsymbol{}
  \newtheorem{assertion}  {\sjtu@label@assertion}  [chapter]
  \newtheorem{assumption} {\sjtu@label@assumption} [chapter]
  \newtheorem{axiom}      {\sjtu@label@axiom}      [chapter]
  \newtheorem{corollary}  {\sjtu@label@corollary}  [chapter]
  \newtheorem{definition} {\sjtu@label@definition} [chapter]
  \newtheorem{example}    {\sjtu@label@example}    [chapter]
  \newtheorem{lemma}      {\sjtu@label@lemma}      [chapter]
  \newtheorem{proposition}{\sjtu@label@proposition}[chapter]
  \newtheorem{remark}     {\sjtu@label@remark}     [chapter]
  \newtheorem{theorem}    {\sjtu@label@theorem}    [chapter]
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\sjtu@atendpackage{algorithm2e}{
  \SetAlgorithmName{\sjtu@label@algorithm}%
                   {\sjtu@label@algorithm}%
                   {\sjtu@label@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \newcommand{\cftalgpresnum}{\sjtu@label@algorithm~}
  \newlength{\cftalgnumwidth}
    \setlength{\cftalgnumwidth}{2.3em}
  \newlength{\sjtu@cftalgnumwidth@tmp}
    \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
  \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  \renewcommand*{\l@algocf}[2]{%
    \vskip \cftbeforefigskip
    {\leftskip \cftfigindent\relax
      \rightskip \@tocrmarg
      \parfillskip -\rightskip
      \parindent \cftfigindent\relax\@afterindenttrue
      \interlinepenalty\@M
      \leavevmode
      \@tempdima \cftalgnumwidth\relax
      \let\@cftbsnum \cftalgpresnum
      \let\@cftasnum \cftfigaftersnum
      \let\@cftasnumb \cftfigaftersnumb
      \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
      {\cftfigfont #1}\nobreak
      \cftfigfillnum{#2}}%
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmcfname}{loa}%
    \chapter*{\listalgorithmcfname}%
    \@mkboth{\listalgorithmcfname}{\listalgorithmcfname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
   \renewcommand{\thealgocf}{\thechapter--\@arabic\c@algocf}
  }
}
\sjtu@atendpackage{algorithm}{
  \RequirePackage{algorithmicx, algpseudocode}
  \floatname{algorithm}{\sjtu@label@algorithm}
  \renewcommand{\listalgorithmname}{\sjtu@label@listalgorithm}
  \@addtoreset{algorithm}{chapter}
  \patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
      \if@twocolumn}
    {}{}
  \newcommand{\cftalgpresnum}{\sjtu@label@algorithm~}
  \newlength{\cftalgnumwidth}
    \setlength{\cftalgnumwidth}{2.3em}
  \newlength{\sjtu@cftalgnumwidth@tmp}
    \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
  \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  \newcommand*{\l@algorithm}[2]{%
    \vskip \cftbeforefigskip
    {\leftskip \cftfigindent\relax
      \rightskip \@tocrmarg
      \parfillskip -\rightskip
      \parindent \cftfigindent\relax\@afterindenttrue
      \interlinepenalty\@M
      \leavevmode
      \@tempdima \cftalgnumwidth\relax
      \let\@cftbsnum \cftalgpresnum
      \let\@cftasnum \cftfigaftersnum
      \let\@cftasnumb \cftfigaftersnumb
      \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
      {\cftfigfont #1}\nobreak
      \cftfigfillnum{#2}}%
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmname}{loa}%
    \chapter*{\listalgorithmname}%
    \@mkboth{\listalgorithmname}{\listalgorithmname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
    \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  }
}
\sjtu@atendpackage{listings}{
  \lstdefinestyle{lstStyleCode}{
    aboveskip=\medskipamount,
    belowskip=\medskipamount,
    basicstyle=\footnotesize\ttfamily,
    commentstyle=\slshape\color{black!60},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    extendedchars=false,
    upquote=true,
    tabsize=2,
    showstringspaces=false,
    xleftmargin=1em,
    xrightmargin=1em,
    breaklines=true,
    breakindent=2em,
    framexleftmargin=1em,
    framexrightmargin=1em,
    backgroundcolor=\color{gray!10},
    columns=flexible,
    keepspaces=true,
    texcl=true,
    mathescape=true
  }
  \lstnewenvironment{codeblock}[1][]
    {\lstset{style=lstStyleCode,language=#1}}{}
}
\sjtu@atendpackage{tikz}{
  \usetikzlibrary{shapes.geometric, arrows}
  \tikzstyle{startstop} = [
    rectangle,
    rounded corners,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{io} = [
    trapezium,
    trapezium left angle=75,
    trapezium right angle=105,
    minimum width=1cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{process} = [
    rectangle,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{decision} = [
    diamond,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black]
  \tikzstyle{arrow} = [thick, ->, >=stealth]
}
\endinput
%%
%% End of file `sjtuthesis.cls'.
