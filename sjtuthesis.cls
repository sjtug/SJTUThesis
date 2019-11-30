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
\def\sjtuthesis{SJTU\textsc{Thesis}}
\def\version{1.0.0rc}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\DeclareStringOption[doctor]{degree}[doctor]
\DeclareStringOption[chinese]{language}[chinese]
\DeclareStringOption[5]{zihao}[5]
\DeclareStringOption[all]{setlatinfont}[all]
\DeclareStringOption[GB]{mathstyle}[GB]
\DeclareStringOption[gb7714-2015]{bibstyle}[gb7714-2015]
\DeclareBoolOption{review}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newcommand{\sjtu@validate@key}[1]{%
  \@ifundefined{sjtu@#1@\csname sjtu@#1\endcsname true}{%
    \ClassError{sjtuthesis}{Invalid value '\csname sjtu@#1\endcsname'}{}%
  }{%
    \csname sjtu@#1@\csname sjtu@#1\endcsname true\endcsname
  }%
}
\newif\ifsjtu@degree@course
\newif\ifsjtu@degree@bachelor
\newif\ifsjtu@degree@master
\newif\ifsjtu@degree@doctor
\sjtu@validate@key{degree}
\ifsjtu@degree@course\sjtu@degree@bachelortrue\fi
\ifsjtu@degree@doctor\sjtu@degree@mastertrue\fi
\newif\ifsjtu@language@chinese
\newif\ifsjtu@language@english
\sjtu@validate@key{language}
\newif\ifsjtu@setlatinfont@none
\newif\ifsjtu@setlatinfont@main
\newif\ifsjtu@setlatinfont@math
\newif\ifsjtu@setlatinfont@all
\sjtu@validate@key{setlatinfont}
\ifsjtu@setlatinfont@all
  \sjtu@setlatinfont@maintrue
  \sjtu@setlatinfont@mathtrue
\fi
\newif\ifsjtu@mathstyle@GB
\@ifundefined{sjtu@mathstyle@\csname sjtu@mathstyle\endcsname true}{}{%
  \sjtu@mathstyle@GBtrue
  \def\sjtu@mathstyle{ISO}
}
\ifsjtu@language@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{math-style=\sjtu@mathstyle}{unicode-math}
\LoadClass[a4paper,zihao=\sjtu@zihao,linespread=1.3,UTF8]{ctexbook}
\ifsjtu@degree@bachelor
  \AtEndOfClass{\input{sjtuthesis-bachelor.ltx}}
\else
  \ifsjtu@degree@master
    \AtEndOfClass{\input{sjtuthesis-graduate.ltx}}
  \fi
\fi
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\ifsjtu@setlatinfont@math
  \RequirePackage{unicode-math}
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
  本\sjtu@label@thesistype 作者
  完全了解学校有关保留、使用\sjtu@label@thesistype 的规定，同意学校保留
  并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
  本人授权\sjtu@label@schoolChi 可以将本\sjtu@label@thesistype 的全部或
  部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存
  和汇编本\sjtu@label@thesistype 。}
\sjtu@def@label{abstractChi}{摘\quad 要}
\sjtu@def@label{abstractEng}{Abstract}
\sjtu@def@label{keywordsChi}{关键词：}
\sjtu@def@label{keywordsEng}{Key words:~}
\ifsjtu@language@english
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
\newif\ifsjtu@xitsnew
\@ifpackagelater{fontspec}{2017/01/20}{
  \IfFontExistsTF{XITSMath-Regular.otf}{
    \sjtu@xitsnewtrue
  }{}
}{}
\ifsjtu@setlatinfont@main
  \ifsjtu@xitsnew
    \setmainfont{XITS}[
      Extension          = .otf,
      UprightFont        = *-Regular,
      BoldFont           = *-Bold,
      ItalicFont         = *-Italic,
      BoldItalicFont     = *-BoldItalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \else
    \setmainfont{xits}[
      Extension          = .otf,
      UprightFont        = *-regular,
      BoldFont           = *-bold,
      ItalicFont         = *-italic,
      BoldItalicFont     = *-bolditalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \fi
  \RequirePackage[opentype,scaled=.9]{sourcesanspro}
  \RequirePackage[opentype,scaled=.9]{sourcecodepro}
\fi
\ifsjtu@setlatinfont@math
  \ifsjtu@xitsnew
    \setmathfont{XITSMath-Regular}[
      Extension    = .otf,
      BoldFont     = XITSMath-Bold,
      StylisticSet = 8
    ]
    \setmathfont{XITSMath-Regular.otf}[range={cal,bfcal},StylisticSet=1]
    \else
    \setmathfont{xits-math}[
      Extension    = .otf,
      BoldFont     = *bold,
      StylisticSet = 8
    ]
    \setmathfont{xits-math.otf}[range={cal,bfcal},StylisticSet=1]
  \fi
\fi
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
\AtEndOfClass{\sloppy}
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
\renewcommand{\cfttabpresnum}{\sjtu@label@table~}
\AtEndPreamble{%
  \newlength{\sjtu@cftfignumwidth@tmp}
    \settowidth{\sjtu@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\sjtu@cftfignumwidth@tmp}
  \newlength{\sjtu@cfttabnumwidth@tmp}
    \settowidth{\sjtu@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\sjtu@cfttabnumwidth@tmp}
}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand{\p@subfigure}{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
}
\newif\ifsjtu@setfloatfont
\renewcommand{\@floatboxreset}{%
  \reset@font
  \ifsjtu@setfloatfont
    \zihao{5}
  \else
    \normalsize
  \fi
  \@setminipage
}
\BeforeBeginEnvironment{longtable}
  {\begingroup\ifsjtu@setfloatfont\zihao{5}\fi}
\AfterEndEnvironment{longtable}
  {\endgroup}
\NewDocumentCommand{\sjtuSetFloatFontOn}{}{\sjtu@setfloatfonttrue}
\NewDocumentCommand{\sjtuSetFloatFontOff}{}{\sjtu@setfloatfontfalse}
\DeclareCaptionFont{sjtucaptionfont}{\zihao{5}\kaishu}
\DeclareCaptionFont{sjtusubcaptionfont}{\zihao{5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = sjtucaptionfont
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = brace,
  justification = justified,
  font          = sjtusubcaptionfont
}
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{\sjtu@label@table}
  \def\figurename{\sjtu@label@figure}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{Table}
  \def\figurename{Figure}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\ifsjtu@mathstyle@GB
  \let\mathellipsis\cdots
  \AtBeginDocument{%
    \renewcommand{\Re}{\operatorname{Re}}%
    \renewcommand{\Im}{\operatorname{Im}}%
  }
\fi
\newcommand\upe{\mathrm{e}}
\newcommand\upi{\mathrm{i}}
\newcommand\upj{\mathrm{j}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\newcommand{\sjtu@square}{%
  \begingroup\CJKfamily+{zhsong}\symbol{"25A1}\endgroup
}
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
  \ifsjtu@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@label@originality}{origtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@label@schoolChi \\%
                \sjtu@label@origtitle}
      \begingroup
        \zihao{4}
        \sjtu@label@origbody
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \sjtu@signbox{\sjtu@label@thesiscat 作者}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentCommand{\makeDeclareAuthorization}{o}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@label@authorization}{authtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@label@schoolChi \\%
                \sjtu@label@authtitle}
      \begingroup
        \zihao{4}
        \sjtu@label@authbody
        \vskip 1ex
        \sjtu@authconf
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \sjtu@signbox{\sjtu@label@thesiscat 作者}
          \hfill
          \sjtu@signbox{指导教师}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentEnvironment{nomenclature}{m}{%
  \cleardoublepage
  \pdfbookmark[0]{\sjtu@label@nomenclature}{nomenclature}
  \chapter*{\sjtu@label@nomenclature}
  \@mkboth{\sjtu@label@nomenclature}%
          {\sjtu@label@nomenclature}%
  \begin{longtable}{#1}
}{\end{longtable}}
\NewDocumentEnvironment{summary}{}{%
  \cleardoublepage
  \chapter*{\sjtu@label@summary}
  \@mkboth{\sjtu@label@summary}%
          {\sjtu@label@summary}%
  \addcontentsline{toc}{chapter}{\sjtu@label@summary}%
}{}
\newcommand{\sjtu@acknowledgements}[1]{\long\gdef\sjtu@acknowledgements@body{#1}}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\sjtu@acknowledgements
}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \chapter*{\sjtu@label@acknowledgements}
    \@mkboth{\sjtu@label@acknowledgements}%
            {\sjtu@label@acknowledgements}%
    \addcontentsline{toc}{chapter}{\sjtu@label@acknowledgements}%
    \sjtu@acknowledgements@body
  \fi
}
\newenvironment{sjtu@bibliolist}[2]{%
  \cleardoublepage
  \chapter{#2}
  \@mkboth{#2}{#2}%
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
  \sfcode`\.\@m
}{%
  \def\@noitemerr
    {\@latex@warning{Empty `bibliolist' environment}}%
  \endlist
}
\newcommand{\sjtu@publications}[1]{\long\gdef\sjtu@publications@body{#1}}
\NewDocumentEnvironment{publications}{O{99}}{%
  \Collect@Body\sjtu@publications
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@publications}
      \sjtu@publications@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@@publications}[1]{\long\gdef\sjtu@@publications@body{#1}}
\NewDocumentEnvironment{publications*}{O{99}}{%
  \Collect@Body\sjtu@@publications
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@publications}
      \sjtu@@publications@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@projects}[1]{\long\gdef\sjtu@projects@body{#1}}
\NewDocumentEnvironment{projects}{O{99}}{%
  \Collect@Body\sjtu@projects
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@projects}
      \sjtu@projects@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@@projects}[1]{\long\gdef\sjtu@@projects@body{#1}}
\NewDocumentEnvironment{projects*}{O{99}}{%
  \Collect@Body\sjtu@@projects
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@projects}
      \sjtu@@projects@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@patents}[1]{\long\gdef\sjtu@patents@body{#1}}
\NewDocumentEnvironment{patents}{O{99}}{%
  \Collect@Body\sjtu@patents
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@patents}
      \sjtu@patents@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@@patents}[1]{\long\gdef\sjtu@@patents@body{#1}}
\NewDocumentEnvironment{patents*}{O{99}}{%
  \Collect@Body\sjtu@@patents
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@label@patents}
      \sjtu@@patents@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@resume}[1]{\long\gdef\sjtu@resume@body{#1}}
\NewDocumentEnvironment{resume}{}{%
  \Collect@Body\sjtu@resume
}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \chapter{\sjtu@label@resume}
    \@mkboth{\sjtu@label@resume}%
            {\sjtu@label@resume}%
    \sjtu@resume@body
  \fi
}
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
\newcommand{\sjtu@uline}[1]{%
  \begingroup
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
  \endgroup
}
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
\newcommand{\sjtu@atendpackage}{\csname ctex_at_end_package:nn\endcsname}
\sjtu@atendpackage{unicode-math}{
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
  \ifsjtu@language@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\sjtu@atendpackage{ntheorem}{
  \ifsjtu@language@chinese
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
  \theoremheaderfont{\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{\enskip}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\sjtu@label@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \newtheorem{theorem}             {\sjtu@label@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\sjtu@label@assertion}
  \newtheorem{axiom}      [theorem]{\sjtu@label@axiom}
  \newtheorem{corollary}  [theorem]{\sjtu@label@corollary}
  \newtheorem{lemma}      [theorem]{\sjtu@label@lemma}
  \newtheorem{proposition}[theorem]{\sjtu@label@proposition}
  \newtheorem{assumption}          {\sjtu@label@assumption} [chapter]
  \newtheorem{definition}          {\sjtu@label@definition} [chapter]
  \newtheorem{example}             {\sjtu@label@example}    [chapter]
  \newtheorem*{remark}             {\sjtu@label@remark}
}
\sjtu@atendpackage{amsthm}{
  \ifsjtu@language@chinese
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
  \newtheoremstyle{sjtuplain}
    {}{}
    {\normalfont}{}
    {\bfseries\heiti}{}
    {\ccwd}{}
  \theoremstyle{sjtuplain}
  \newtheorem{theorem}             {\sjtu@label@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\sjtu@label@assertion}
  \newtheorem{axiom}      [theorem]{\sjtu@label@axiom}
  \newtheorem{corollary}  [theorem]{\sjtu@label@corollary}
  \newtheorem{lemma}      [theorem]{\sjtu@label@lemma}
  \newtheorem{proposition}[theorem]{\sjtu@label@proposition}
  \newtheorem{assumption}          {\sjtu@label@assumption} [chapter]
  \newtheorem{definition}          {\sjtu@label@definition} [chapter]
  \newtheorem{example}             {\sjtu@label@example}    [chapter]
  \newtheorem*{remark}             {\sjtu@label@remark}
  \renewcommand\proofname\sjtu@label@proof
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
      {\bfseries\heiti #1~}
      \hspace\labelsep\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\sjtu@atendpackage{algorithm2e}{
  \SetAlgorithmName{\sjtu@label@algorithm}%
                   {\sjtu@label@algorithm}%
                   {\sjtu@label@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \newcommand{\cftalgpresnum}{\sjtu@label@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \renewcommand*{\l@algocf}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
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
  \@addtoreset{algorithm}{chapter}
  \patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
      \if@twocolumn}
    {}{}
  \renewcommand{\listalgorithmname}{\sjtu@label@listalgorithm}
  \newcommand{\cftalgpresnum}{\sjtu@label@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \newcommand*{\l@algorithm}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
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
    {\lstset{style=lstStyleCode,#1}}{}
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
