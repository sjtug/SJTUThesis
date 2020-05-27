%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2020 by SJTUG
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
\newcommand\sjtu@error[1]{%
  \ClassError{sjtuthesis}{#1}{}%
}
\newcommand\sjtu@warning[1]{%
  \ClassWarning{sjtuthesis}{#1}{}%
}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\newcommand\sjtusetup[1]{%
  \kvsetkeys{sjtu}{#1}%
}
\newcommand\sjtu@define@key[2]{%
  \kvsetkeys{#1@key}{#2}%
}
\newcommand\sjtu@set@family@handler[1]{%
  \kv@set@family@handler{#1@key}{%
    \def\sjtu@@initial{}%
    \def\sjtu@@choices{}%
    \@namedef{#1@##1@@default}{}%
    \@namedef{#1@##1@@check}{}%
    \@namedef{#1@##1@@code}{}%
    \@namedef{#1@##1@@name}{##1}%
    \kv@define@key{#1@value}{name}{%
      \@namedef{#1@##1@@name}{####1}%
    }%
    \kv@define@key{#1@value}{choices}{%
      \def\sjtu@@choices{####1}%
      \@namedef{#1@##1@@reset}{}%
      \@namedef{#1@##1@@check}{%
        \@ifundefined{%
          if#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}%
        }{%
          \sjtu@error{Invalid value `##1 = \@nameuse{#1@\@nameuse{#1@##1@@name}}'}%
        }%
        \@nameuse{#1@##1@@reset}%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}true}%
      }%
    }%
    \kv@define@key{#1@value}{initial}{%
      \def\sjtu@@initial{####1}%
      \expandafter\ifx\csname #1@##1@@default\endcsname\@empty
        \@namedef{#1@##1@@default}{####1}%
      \fi
    }%
    \kv@define@key{#1@value}{default}{%
      \@namedef{#1@##1@@default}{####1}%
    }%
    \kvsetkeys{#1@value}{##2}%
    \@namedef{#1@\@nameuse{#1@##1@@name}}{}%
    \kv@set@family@handler{#1@choice}{%
      \ifx\sjtu@@initial\@empty
        \def\sjtu@@initial{####1}%
      \fi
      \expandafter\ifx\csname #1@##1@@default\endcsname\@empty
        \@namedef{#1@##1@@default}{####1}%
      \fi
      \expandafter\newif\csname if#1@\@nameuse{#1@##1@@name}@####1\endcsname
      \expandafter\g@addto@macro\csname #1@##1@@reset\endcsname{%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@####1false}%
      }%
    }%
    \kvsetkeys@expandafter{#1@choice}{\sjtu@@choices}%
    \expandafter\let\csname #1@\@nameuse{#1@##1@@name}\endcsname\sjtu@@initial
    \expandafter\ifx\csname #1@\@nameuse{#1@##1@@name}\endcsname\@empty\else
      \@nameuse{#1@##1@@check}%
    \fi
    \kv@define@key{#1}{##1}[\@nameuse{#1@##1@@default}]{%
      \@namedef{#1@\@nameuse{#1@##1@@name}}{####1}%
      \@nameuse{#1@##1@@check}%
      \@nameuse{#1@##1@@code}%
    }%
  }
}
\newcommand\sjtu@option@hook[3]{%
  \expandafter\g@addto@macro\csname #1@#2@@code\endcsname{#3}%
}
\sjtu@set@family@handler{sjtu}
\sjtu@define@key{sjtu}{
  degree = {
    choices = {
      doctor,
      master,
      bachelor,
      course,
    },
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  zihao = {
    choices = {
      -4,
      5,
      auto,
      false,
    },
    initial = auto,
  },
  latinfontset = {
    choices = {
      xits,
      times,
      stix,
      step,
      termes,
      pagella,
      cambria,
      libertinus,
      lm,
      none,
    },
  },
}
\newif\ifsjtu@degree@graduate
\newcommand\sjtu@set@graduate{%
  \sjtu@degree@graduatefalse
  \ifsjtu@degree@doctor
    \sjtu@degree@graduatetrue
  \fi
  \ifsjtu@degree@master
    \sjtu@degree@graduatetrue
  \fi
}
\newcommand\sjtu@set@zihao{%
  \ifsjtu@zihao@auto
    \ifsjtu@degree@graduate
      \def\sjtu@zihao{-4}
    \else
      \def\sjtu@zihao{5}
    \fi
  \fi
}
\DeclareBoolOption{review}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\sjtu@set@graduate
\sjtu@set@zihao
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8,scheme=plain,linespread=1.3,zihao=\sjtu@zihao]{ctexbook}[2018/04/01]
\AtEndOfClass{
  \ifsjtu@degree@graduate
    \input{sjtuthesis-graduate.ltx}
  \else
    \input{sjtuthesis-undergraduate.ltx}
  \fi
}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{xeCJKfntef}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom, hang]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{url}
\RequirePackage{filehook}
\newcommand\sjtu@package@conflict[2]{
  \AtBeginOfPackageFile*{#2}{
    \sjtu@error{The `#2' package is incompatible with required `#1'}
  }
}
\sjtu@package@conflict{unicode-math}{amscd}
\sjtu@package@conflict{unicode-math}{amsfonts}
\sjtu@package@conflict{unicode-math}{amssymb}
\sjtu@package@conflict{unicode-math}{bbm}
\sjtu@package@conflict{unicode-math}{bm}
\sjtu@package@conflict{unicode-math}{eucal}
\sjtu@package@conflict{unicode-math}{eufrak}
\sjtu@package@conflict{unicode-math}{mathrsfs}
\kv@define@key{sjtu}{style}{
  \kvsetkeys{sjtu@style}{#1}
}
\sjtu@set@family@handler{sjtu@style}
\sjtu@define@key{sjtu@style}{
  frontmatter-numbering = {
    name = frontmatter@numbering,
    choices = {
      true,
      false,
    }
  },
  indent-headings = {
    name = indent@headings,
    choices = {
      fixed,
      auto,
      false,
    },
    initial = false,
    default = fixed,
  },
  title-logo-color = {
    name = title@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = blue,
  },
  header-logo-color = {
    name = header@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = black,
  },
  float-number-separator = {
    name = fl@num@sep,
    initial = {--},
  },
  equation-number-separator = {
    name = eq@num@sep,
    initial = {--},
  },
}
\kv@define@key{sjtu}{info}{
  \kvsetkeys{sjtu@info}{#1}
}
\sjtu@set@family@handler{sjtu@info}
\sjtu@define@key{sjtu@info}{
  title           = { name = title@zh },
  title*          = { name = title@en },
  keywords        = { name = keywords@zh },
  keywords*       = { name = keywords@en },
  author          = { name = author@zh },
  author*         = { name = author@en },
  id,
  supervisor      = { name = supervisor@zh },
  supervisor*     = { name = supervisor@en },
  assisupervisor  = { name = assisupervisor@zh },
  assisupervisor* = { name = assisupervisor@en },
  degree          = { name = degree@zh },
  degree*         = { name = degree@en },
  department      = { name = department@zh },
  department*     = { name = department@en },
  major           = { name = major@zh },
  major*          = { name = major@en },
  coursename      = { name = coursename@zh },
  coursename*     = { name = coursename@en },
  fund            = { name = fund@zh },
  fund*           = { name = fund@en },
  date            = {%
    initial = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}
\newcommand\sjtu@nopar[1]{%
  \begingroup\let\\\@empty#1\endgroup%
}
\newcommand\sjtu@clist@use[2]{%
  \def\sjtu@@tmp{}%
  \def\sjtu@clist@processor##1{%
    \ifx\sjtu@@tmp\@empty
      \def\sjtu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \expandafter\comma@parse\expandafter{#1}{\sjtu@clist@processor}%
}
\ifsjtu@language@chinese
  \def\sjtu@info@title{\sjtu@info@title@zh}
  \def\sjtu@info@keywords{\sjtu@info@keywords@zh}
  \def\sjtu@info@author{\sjtu@info@author@zh}
\else
  \def\sjtu@info@title{\sjtu@info@title@en}
  \def\sjtu@info@keywords{\sjtu@info@keywords@en}
  \def\sjtu@info@author{\sjtu@info@author@en}
\fi
\newcommand\sjtu@date[2]{%
  \ifsjtu@review\relax\else
    \edef\sjtu@@date{#2}%
    \def\sjtu@@process@date##1-##2-##3\@nil{%
      #1{##1}{##2}{##3}%
    }%
    \expandafter\sjtu@@process@date\sjtu@@date\@nil
  \fi
}
\newcommand\sjtu@date@format@zh[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\sjtu@date@month@en[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\sjtu@date@format@en[3]{\sjtu@date@month@en{#2} #3, #1}
\kv@define@key{sjtu}{name}{
  \kvsetkeys{sjtu@name}{#1}
}
\sjtu@set@family@handler{sjtu@name}
\sjtu@define@key{sjtu@name}{
  appendix          = { initial = Appendix },
  contents          = { initial = Contents },
  listfigure        = { initial = List of Figures },
  listtable         = { initial = List of Tables },
  listalgorithm     = { initial = List of Algorithms },
  figure            = { initial = Figure },
  figure*           = { name = figure@second, initial = 图 },
  table             = { initial = Table },
  table*            = { name = table@second, initial = 表 },
  algorithm         = { initial = Algorithm },
  nomenclature      = { initial = Nomenclature },
  summary           = { initial = Summary },
  bib               = { initial = Bibliography },
  index             = { initial = Index },
  acknowledgements  = { initial = Acknowledgements },
  publications      = { initial = Publications },
  achievements      = { initial = Research Achievements },
  resume            = { initial = Resume },
}
\newcommand\sjtu@name@def[2]{%
  \@namedef{sjtu@name@#1}{#2}
}
\sjtu@name@def{school@zh}{上海交通大学}
\sjtu@name@def{school@en}{Shanghai Jiao Tong University}
\ifsjtu@degree@graduate
  \ifsjtu@degree@doctor
    \sjtu@name@def{degree@type@zh}{博士}
    \sjtu@name@def{degree@type@en}{Doctor}
  \else
    \sjtu@name@def{degree@type@zh}{硕士}
    \sjtu@name@def{degree@type@en}{Master}
  \fi
  \sjtu@name@def{author@zh}{\sjtu@name@degree@type@zh 研究生}
  \sjtu@name@def{author@en}{Candidate}
  \sjtu@name@def{id@zh}{学号}
  \sjtu@name@def{id@en}{Student ID}
  \sjtu@name@def{supervisor@zh}{导师}
  \sjtu@name@def{supervisor@en}{Supervisor}
  \sjtu@name@def{assisupervisor@zh}{副导师}
  \sjtu@name@def{assisupervisor@en}{Assistant Supervisor}
  \sjtu@name@def{degree@zh}{申请学位}
  \sjtu@name@def{degree@en}{Academic Degree Applied for}
  \sjtu@name@def{major@zh}{学科}
  \sjtu@name@def{major@en}{Speciality}
  \sjtu@name@def{department@zh}{所在单位}
  \sjtu@name@def{department@en}{Affiliation}
  \sjtu@name@def{defenddate@zh}{答辩日期}
  \sjtu@name@def{defenddate@en}{Date of Defence}
  \sjtu@name@def{conferring@zh}{授予学位单位}
  \sjtu@name@def{conferring@en}{Degree-Conferring-Institution}
  \sjtu@name@def{thesis@type}{学位论文}
  \sjtu@name@def{thesis@kind}{\sjtu@name@thesis@type}
  \sjtu@name@def{subject@zh}{%
    \sjtu@name@school@zh\sjtu@name@degree@type@zh\sjtu@name@thesis@type
  }
  \sjtu@name@def{subject@en}{%
    Dissertation Submitted to \sjtu@name@school@en \\
    for the Degree of \sjtu@name@degree@type@en
  }
\else
  \ifsjtu@degree@course
    \sjtu@name@def{degree@type@zh}{}
    \sjtu@name@def{degree@type@en}{}
    \sjtu@name@def{thesis@type}{课程论文}
    \sjtu@name@def{thesis@kind}{\sjtu@name@thesis@type}
    \sjtu@name@def{subject@zh}{\sjtu@name@thesis@type}
    \sjtu@name@def{subject@en}{Course Paper}
  \else
    \sjtu@name@def{degree@type@zh}{学士}
    \sjtu@name@def{degree@type@en}{Bachelor}
    \sjtu@name@def{thesis@type}{学位论文}
    \sjtu@name@def{thesis@kind}{毕业设计（论文）}
    \sjtu@name@def{subject@zh}{\sjtu@name@degree@type@zh\sjtu@name@thesis@type}
    \sjtu@name@def{subject@en}{Thesis of \sjtu@name@degree@type@en}
  \fi
  \sjtu@name@def{author@zh}{学生姓名}
  \sjtu@name@def{id@zh}{学生学号}
  \sjtu@name@def{supervisor@zh}{指导教师}
  \sjtu@name@def{coursename@zh}{课程名称}
  \sjtu@name@def{major@zh}{专业}
  \sjtu@name@def{department@zh}{学院(系)}
  \sjtu@name@def{digest}{英文大摘要}
\fi
\sjtu@name@def{orig@subtitle@zh}{原创性声明}
\sjtu@name@def{orig@subtitle@en}{Declaration of Originality}
\sjtu@name@def{auth@subtitle@zh}{版权使用授权书}
\sjtu@name@def{auth@subtitle@en}{Declaration of Authorization}
\sjtu@name@def{orig@title}{\sjtu@name@thesis@kind\sjtu@name@orig@subtitle@zh}
\sjtu@name@def{auth@title}{\sjtu@name@thesis@kind\sjtu@name@auth@subtitle@zh}
\sjtu@name@def{title@qouted}{《\sjtu@nopar\sjtu@info@title@zh》}
\sjtu@name@def{origbody}{%
  本人郑重声明：所呈交的\sjtu@name@thesis@kind \sjtu@name@title@qouted，
  是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用
  的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对
  本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全
  意识到本声明的法律结果由本人承担。}
\sjtu@name@def{authbody}{%
  本\sjtu@name@thesis@kind 作者
  完全了解学校有关保留、使用\sjtu@name@thesis@kind 的规定，同意学校保留
  并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
  本人授权\sjtu@name@school@zh 可以将本\sjtu@name@thesis@kind 的全部或部
  分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和
  汇编本\sjtu@name@thesis@kind 。}
\sjtu@name@def{abstract@zh}{摘\hspace{\ccwd}要}
\sjtu@name@def{abstract@en}{Abstract}
\sjtu@name@def{keywords@zh}{关键词：}
\sjtu@name@def{keywords@en}{Key words:~}
\ifsjtu@language@chinese
  \sjtusetup{
    name = {
      appendix          = {附录},
      contents          = {目\hspace{\ccwd}录},
      listfigure        = {插图索引},
      listtable         = {表格索引},
      listalgorithm     = {算法索引},
      figure            = {图},
      figure*           = {Figure},
      table             = {表},
      table*            = {Table},
      algorithm         = {算法},
      nomenclature      = {主要符号对照表},
      summary           = {全文总结},
      bib               = {参考文献},
      index             = {索\hspace{\ccwd}引},
      acknowledgements  = {致\hspace{\ccwd}谢},
      publications      = {攻读学位期间发表（或录用）的学术论文},
      achievements      = {攻读学位期间获得的科研成果},
      resume            = {个人简历},
    }
  }
  \ctexset{
    chapter/name    = {第,章},
    chapter/number  = \chinese{chapter},
  }
  \sjtu@name@def{titlepage}{扉页}
  \sjtu@name@def{subject}{\sjtu@name@subject@zh}
  \sjtu@name@def{orig@subtitle}{\sjtu@name@orig@subtitle@zh}
  \sjtu@name@def{auth@subtitle}{\sjtu@name@auth@subtitle@zh}
  \sjtu@name@def{abstract}{\sjtu@name@abstract@zh}
\else
  \sjtu@name@def{titlepage}{Title Page}
  \sjtu@name@def{subject}{\sjtu@name@subject@en}
  \sjtu@name@def{orig@subtitle}{\sjtu@name@orig@subtitle@en}
  \sjtu@name@def{auth@subtitle}{\sjtu@name@auth@subtitle@en}
  \sjtu@name@def{abstract}{\sjtu@name@abstract@en}
\fi
\ctexset{%
  appendixname   = \sjtu@name@appendix,
  contentsname   = \sjtu@name@contents,
  listfigurename = \sjtu@name@listfigure,
  listtablename  = \sjtu@name@listtable,
  figurename     = \sjtu@name@figure,
  tablename      = \sjtu@name@table,
  bibname        = \sjtu@name@bib,
  indexname      = \sjtu@name@index,
}
\let\sjtu@font@family@xits\@empty
\newcommand\sjtu@font@set@xits@names{%
  \ifx\sjtu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\sjtu@font@family@xits{XITS}%
      \gdef\sjtu@font@style@xits@rm{Regular}%
      \gdef\sjtu@font@style@xits@bf{Bold}%
      \gdef\sjtu@font@style@xits@it{Italic}%
      \gdef\sjtu@font@style@xits@bfit{BoldItalic}%
      \gdef\sjtu@font@name@xits@math@rm{XITSMath-Regular}%
      \gdef\sjtu@font@name@xits@math@bf{XITSMath-Bold}%
    }{%
      \gdef\sjtu@font@family@xits{xits}%
      \gdef\sjtu@font@style@xits@rm{regular}%
      \gdef\sjtu@font@style@xits@bf{bold}%
      \gdef\sjtu@font@style@xits@it{italic}%
      \gdef\sjtu@font@style@xits@bfit{bolditalic}%
      \gdef\sjtu@font@name@xits@math@rm{xits-math}%
      \gdef\sjtu@font@name@xits@math@bf{xits-mathbold}%
    }%
  \fi
}
\let\sjtu@font@family@libertinus\@empty
\newcommand\sjtu@font@set@libertinus@names{%
  \ifx\sjtu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\sjtu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\sjtu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\sjtu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\sjtu@font@style@libertinus@rm{Regular}%
      \gdef\sjtu@font@style@libertinus@bf{Bold}%
      \gdef\sjtu@font@style@libertinus@it{Italic}%
      \gdef\sjtu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\sjtu@font@family@libertinus@serif{libertinusserif}%
      \gdef\sjtu@font@family@libertinus@sans{libertinussans}%
      \gdef\sjtu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\sjtu@font@style@libertinus@rm{regular}%
      \gdef\sjtu@font@style@libertinus@bf{bold}%
      \gdef\sjtu@font@style@libertinus@it{italic}%
      \gdef\sjtu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\newcommand\sjtu@set@font@xits{%
  \sjtu@font@set@xits@names
  \setmainfont{\sjtu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\sjtu@font@style@xits@rm,
    BoldFont       = *-\sjtu@font@style@xits@bf,
    ItalicFont     = *-\sjtu@font@style@xits@it,
    BoldItalicFont = *-\sjtu@font@style@xits@bfit,
  ]
}
\newcommand\sjtu@set@font@times{%
  \setmainfont{Times New Roman}[Ligatures = Rare]
  \setsansfont{Arial}
  \setmonofont{Courier New}[Scale = MatchLowercase]
}
\newcommand\sjtu@set@font@stix{%
  \setmainfont{STIX2Text}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\sjtu@set@font@step{%
  \setmainfont{STEP}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\sjtu@set@font@source@sans@mono{%
  \setsansfont{SourceSansPro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
  ]
  \setmonofont{SourceCodePro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
    Scale          = MatchLowercase,
  ]
}
\newcommand\sjtu@set@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\sjtu@set@font@pagella{%
  \setmainfont{texgyrepagella}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\sjtu@set@font@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\sjtu@set@font@cambria{%
  \setmainfont{Cambria}
  \setsansfont{Calibri}
  \setmonofont{Consolas}[Scale = MatchLowercase]
}
\newcommand\sjtu@set@font@libertinus{%
  \sjtu@font@set@libertinus@names
  \setmainfont{\sjtu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\sjtu@font@style@libertinus@rm,
    BoldFont       = *-\sjtu@font@style@libertinus@bf,
    ItalicFont     = *-\sjtu@font@style@libertinus@it,
    BoldItalicFont = *-\sjtu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\sjtu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\sjtu@font@style@libertinus@rm,
    BoldFont       = *-\sjtu@font@style@libertinus@bf,
    ItalicFont     = *-\sjtu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\sjtu@set@font@lm{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\sjtu@set@math@font@xits{%
  \sjtu@font@set@xits@names
  \setmathfont{\sjtu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \sjtu@font@name@xits@math@bf,
    StylisticSet = 8,
  ]%
  \setmathfont{\sjtu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \sjtu@font@name@xits@math@bf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\sjtu@set@math@font@stix{%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 8,
  ]%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\sjtu@set@math@font@step{%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 8,
  ]%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\sjtu@set@math@font@termes{%
  \setmathfont{texgyretermes-math.otf}
}
\newcommand\sjtu@set@math@font@pagella{%
  \setmathfont{texgyrepagella-math.otf}
}
\newcommand\sjtu@set@math@font@cambria{%
  \setmathfont{Cambria Math}
}
\newcommand\sjtu@set@math@font@libertinus{%
  \sjtu@font@set@libertinus@names
  \setmathfont{\sjtu@font@name@libertinus@math .otf}%
}
\newcommand\sjtu@set@math@font@lm{%
  \setmathfont{latinmodern-math.otf}%
}
\newcommand\sjtu@load@fontset@xits{%
  \sjtu@set@font@xits
  \sjtu@set@font@source@sans@mono
  \sjtu@set@math@font@xits
}
\newcommand\sjtu@load@fontset@times{%
  \sjtu@set@font@times
  \sjtu@set@math@font@xits
}
\newcommand\sjtu@load@fontset@stix{%
  \sjtu@set@font@stix
  \sjtu@set@font@source@sans@mono
  \sjtu@set@math@font@stix
}
\newcommand\sjtu@load@fontset@step{%
  \sjtu@set@font@step
  \sjtu@set@font@source@sans@mono
  \sjtu@set@math@font@step
}
\newcommand\sjtu@load@fontset@termes{%
  \sjtu@set@font@termes
  \sjtu@set@font@texgyre@sans@mono
  \sjtu@set@math@font@termes
}
\newcommand\sjtu@load@fontset@pagella{%
  \sjtu@set@font@pagella
  \sjtu@set@font@texgyre@sans@mono
  \sjtu@set@math@font@pagella
}
\newcommand\sjtu@load@fontset@cambria{%
  \sjtu@set@font@cambria
  \sjtu@set@math@font@cambria
}
\newcommand\sjtu@load@fontset@libertinus{%
  \sjtu@set@font@libertinus
  \sjtu@set@math@font@libertinus
}
\newcommand\sjtu@load@fontset@lm{%
  \sjtu@set@font@lm
  \sjtu@set@math@font@lm
}
\newcommand\sjtu@load@fontset@none{\relax}
\newcommand\sjtu@load@fontset{%
  \@nameuse{sjtu@load@fontset@\sjtu@latinfontset}
}
\sjtu@load@fontset
\sjtu@option@hook{sjtu}{latinfontset}{%
  \sjtu@load@fontset
}
\def\sjtu@thepage{}
\def\sjtu@lastpageref{}
\newif\ifsjtu@pagenumbering \sjtu@pagenumberingtrue
\ifsjtu@degree@graduate
  \newcommand\sjtu@thepage@format[2]{---~{\bfseries{#1}}~---}
\else
  \ifsjtu@language@chinese
    \newcommand\sjtu@thepage@format[2]{第~{#1}~页\,共~{#2}~页}
  \else
    \newcommand\sjtu@thepage@format[2]{--~~Page~~{#1}~~of~~{#2}~~--}
  \fi
\fi
\def\sjtu@info@fund{}
\fancypagestyle{sjtu@title}{%
  \fancyhf{}
  \fancyfoot[L]{\ifsjtu@review\relax\else\sjtu@info@fund\fi}
  \renewcommand\headrulewidth{0pt}
  \renewcommand\footrulewidth{0pt}
}
\ifsjtu@degree@graduate
  \fancypagestyle{sjtu@plain}{%
    \fancyhf{}
    \fancyhead[C]{\zihao{-5}\sjtu@name@subject@zh}
    \fancyfoot[C]{%
      \ifsjtu@pagenumbering
        \zihao{-5}\sjtu@thepage@format{\sjtu@thepage}{\sjtu@lastpageref}%
      \fi
    }
    \renewcommand\headrule{%
      \hrule\@height2.25\p@\@width\headwidth
      \vskip 0.75\p@
      \hrule\@height0.75\p@\@width\headwidth
      \vskip -2.75\p@
    }
  }
\else
  \fancypagestyle{sjtu@plain}{%
    \fancyhf{}
    \fancyhead[L]{%
      \includegraphics[height=32pt]%
        {sjtu-vi-logo-\sjtu@style@header@logo@color.pdf}%
    }
    \fancyhead[R]{%
      \parbox[b]{0.75\textwidth}{%
        \raggedleft\nouppercase{\zihao{-5}\heiti\sjtu@info@title}%
      }
    }
    \fancyfoot[C]{%
      \ifsjtu@pagenumbering
        \zihao{-5}\sjtu@thepage@format{\sjtu@thepage}{\sjtu@lastpageref}%
      \fi
    }
    \renewcommand\headrulewidth{0.75\p@}
  }
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
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifsjtu@style@frontmatter@numbering@false
    \sjtu@pagenumberingfalse
  \fi
  \pagenumbering{Roman}
  \def\sjtu@thepage{\thepage}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.Roman}}
  \pagestyle{sjtu@plain}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \sjtu@pagenumberingtrue
  \sjtu@setfloatfonttrue
  \pagenumbering{arabic}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.arabic}}
}
\renewcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse
}
\ctexset{%
  chapter = {%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {\ifsjtu@degree@graduate 0pt\else 1ex\fi},
    afterskip    = {\ifsjtu@degree@graduate 3ex\else 4ex\fi},
  },
  section = {%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1ex \@plus .2ex},
  },
  subsection = {%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1ex \@plus .2ex},
  },
  subsubsection = {%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = {1ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}
\newcommand\sjtu@style@set@indent@headings{%
  \ifsjtu@style@indent@headings@fixed
    \sjtu@style@indent@headings@autotrue
    \gdef\sjtu@indent@headings@width{\parindent}
  \else
    \gdef\sjtu@indent@headings@width{2\ccwd}
  \fi
  \ifsjtu@style@indent@headings@auto
    \ifsjtu@degree@graduate\relax\else
      \ctexset{%
        subsubsection/name   = {(,)},
        subsubsection/number = \arabic{subsubsection},
      }
    \fi
  \else
    \gdef\sjtu@indent@headings@width{\z@}
    \ctexset{%
      subsubsection/name   = {},
      subsubsection/number = \thesubsubsection,
    }
  \fi
  \ctexset{%
    section/indent       = \sjtu@indent@headings@width,
    subsection/indent    = \sjtu@indent@headings@width,
    subsubsection/indent = \sjtu@indent@headings@width,
  }
}
\sjtu@style@set@indent@headings
\sjtu@option@hook{sjtu@style}{indent-headings}{%
  \sjtu@style@set@indent@headings
}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true,
}
\AtEndOfClass{\sloppy}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\def\sjtu@enclosed@number#1{%
  \ifnum\value{#1} >10%
    \sjtu@error{%
      Too many footnotes in this page.
      Keep footnote no more than 10%
    }%
  \fi
  {\CJKfamily+{}\symbol{\the\numexpr\value{#1}+"245F\relax}}%
}
\renewcommand{\thefootnote}{\sjtu@enclosed@number{footnote}}
\renewcommand{\thempfootnote}{\sjtu@enclosed@number{mpfootnote}}
\footnotemargin1.5em\relax
\let\sjtu@makefnmark\@makefnmark
\def\sjtu@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\sjtu@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\sjtu@makefnmark}{}{}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\newcommand\sjtu@pdfbookmark[2]{}
\newcommand\sjtu@phantomsection{}
\NewDocumentCommand{\sjtu@chapter}{s O{#3} m O{#2}}{
  \if@openright\cleardoublepage\else\clearpage\fi%
  \IfBooleanTF{#1}{%
    \ifthenelse{\equal{#4}{}}{\relax}{%
      \sjtu@pdfbookmark{0}{#4}%
    }
  }{%
    \sjtu@phantomsection
    \addcontentsline{toc}{chapter}{#4}%
  }%%
  \chapter*{#3}%
  \@mkboth{#2}{#2}%
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \sjtu@chapter*{\contentsname}%
  \@starttoc{toc}%
}
\def\sjtu@listof#1{% #1: float type
  \setcounter{tocdepth}{2} % restore tocdepth in case being modified
  \@ifstar
    {\sjtu@chapter*{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
    {\sjtu@chapter{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{\sjtu@listof{figure}}
\renewcommand\listoftables{\sjtu@listof{table}}
\ifsjtu@language@chinese
  \renewcommand\cftdot{\textperiodcentered}
\fi
\renewcommand\cftdotsep{1}
\renewcommand\cftfigpresnum{\sjtu@name@figure~}
\renewcommand\cfttabpresnum{\sjtu@name@table~}
\AtEndPreamble{%
  \newlength{\sjtu@cftfignumwidth@tmp}
    \settowidth{\sjtu@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\sjtu@cftfignumwidth@tmp}
  \newlength{\sjtu@cfttabnumwidth@tmp}
    \settowidth{\sjtu@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\sjtu@cfttabnumwidth@tmp}
}
\renewcommand\textfraction{0.15}
\renewcommand\topfraction{0.85}
\renewcommand\bottomfraction{0.65}
\renewcommand\floatpagefraction{0.60}
\AtBeginDocument{%
  \renewcommand\thefigure{\thechapter\sjtu@style@fl@num@sep\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand\thetable{\thechapter\sjtu@style@fl@num@sep\arabic{table}}
  \renewcommand\theequation{\thechapter\sjtu@style@eq@num@sep\arabic{equation}}
}
\newif\ifsjtu@setfloatfont
\renewcommand\@floatboxreset{%
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
\DeclareCaptionFont{sjtu@caption@font}{\zihao{5}\kaishu}
\DeclareCaptionFont{sjtu@subcaption@font}{\zihao{5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = sjtu@caption@font
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = brace,
  justification = justified,
  font          = sjtu@subcaption@font
}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{\sjtu@name@table@second}
  \def\figurename{\sjtu@name@figure@second}}
\captionsetup[bi-second]{bi-second}
\let\mathellipsis\cdots
\AtBeginDocument{%
  \renewcommand\Re{\operatorname{Re}}%
  \renewcommand\Im{\operatorname{Im}}%
}
\newcommand\upe{\mathrm{e}}
\newcommand\upi{\mathrm{i}}
\newcommand\upj{\mathrm{j}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\newcommand\sjtu@square{%
  \begingroup\CJKfamily+{}\symbol{"25A1}\endgroup
}
\newcommand\sjtu@authconf{%
  \par\hspace{7\ccwd}%
  {\heiti 保\hspace{1\ccwd}密}~\sjtu@square，在 \uline{\hspace{3em}}
  年解密后适用本授权书。\par
  本\sjtu@name@thesis@type 属于
  \par\hspace{7\ccwd}%
  {\heiti 不保密}~\sjtu@square。
  \vskip 1ex
  （请在以上方框内打“$\checkmark$”）
}
\newcommand\sjtu@signbox[1]{%
  \parbox{.45\textwidth}{%
    #1 签名： \vskip 4em%
    日期： \hspace{\stretch{3}} 年%
    \hspace{\stretch{2}} 月 \hspace{\stretch{2}} 日%
  }
}
\NewDocumentCommand{\makeorigpage}{s o}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \IfNoValueTF{#2}{%
      \thispagestyle{empty}
      \sjtu@chapter*[\sjtu@name@orig@subtitle]{%
        \zihao{-2}\sjtu@name@school@zh\\\sjtu@name@orig@title
      }
      \IfBooleanT{#1}{%
        \let\sjtu@name@title@qouted\@empty
      }
      \begingroup
        \zihao{4}
        \sjtu@name@origbody
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \sjtu@signbox{\sjtu@name@thesis@type 作者}
        \end{minipage}
      \endgroup
    }{%
      \sjtu@pdfbookmark{0}{\sjtu@name@orig@subtitle}%
      \includepdf[pagecommand={\thispagestyle{empty}}]{#1}
    }
  \fi
}
\NewDocumentCommand{\makeauthpage}{o}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \sjtu@chapter*[\sjtu@name@auth@subtitle]{%
        \zihao{-2}\sjtu@name@school@zh\\\sjtu@name@auth@title
      }
      \begingroup
        \zihao{4}
        \sjtu@name@authbody
        \vskip 1ex
        \sjtu@authconf
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \sjtu@signbox{\sjtu@name@thesis@type 作者}
          \hfill
          \sjtu@signbox{指导教师}
        \end{minipage}
      \endgroup
    }{%
      \sjtu@pdfbookmark{0}{\sjtu@name@auth@subtitle}%
      \includepdf[pagecommand={\thispagestyle{empty}}]{#1}
    }
  \fi
}
\newcommand\sjtu@save@env@body[1]{\long\gdef\sjtu@saved@env@body{#1}}
\NewDocumentEnvironment{nomenclature}{}{%
  \sjtu@chapter{\sjtu@name@nomenclature}
}{}
\NewDocumentEnvironment{nomenclature*}{}{%
  \sjtu@chapter*{\sjtu@name@nomenclature}
}{}
\NewDocumentEnvironment{summary}{}{%
  \sjtu@chapter{\sjtu@name@summary}
}{}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review\relax\else
    \sjtu@chapter{\sjtu@name@acknowledgements}
    \sjtu@saved@env@body
  \fi
}
\newenvironment{sjtu@bibliolist}[2]{%
  \sjtu@chapter{#2}
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
\NewDocumentEnvironment{publications}{O{99}}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@publications}
      \sjtu@saved@env@body
    \end{sjtu@bibliolist}
  \fi
}
\NewDocumentEnvironment{publications*}{O{99}}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@publications}
      \sjtu@saved@env@body
    \end{sjtu@bibliolist}
  \fi
}
\NewDocumentEnvironment{achievements}{O{99}}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@achievements}
      \sjtu@saved@env@body
    \end{sjtu@bibliolist}
  \fi
}
\NewDocumentEnvironment{achievements*}{O{99}}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@achievements}
      \sjtu@saved@env@body
    \end{sjtu@bibliolist}
  \fi
}
\NewDocumentEnvironment{resume}{}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@review\relax\else
    \sjtu@chapter{\sjtu@name@resume}
    \sjtu@saved@env@body
  \fi
}
\AtEndPreamble{
  \ifsjtu@review%
    \sjtusetup{%
      info = {
        author          = {},
        author*         = {},
        id              = {},
        supervisor      = {},
        supervisor*     = {},
        assisupervisor  = {},
        assisupervisor* = {},
      }
    }
  \fi
}
\NewDocumentCommand{\encrypt}{m O{***}}{%
  \ifsjtu@review
    {#2}
  \else
    {#1}
  \fi
}
\newcommand\sjtu@uline[1]{%
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
\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }
  \newcounter{sjtu@bookmark}
  \renewcommand\sjtu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{sjtu@bookmark}%
    \pdfbookmark[#1]{#2}{sjtuchapter.\thesjtu@bookmark}%
  }
  \renewcommand\sjtu@phantomsection{%
    \phantomsection
  }
  \pdfstringdefDisableCommands{%
    \let\\\@empty 
    \let\quad\@empty
    \let\hspace\@gobble
  }
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \AtBeginDocument{%
    \hypersetup{
      pdftitle    = \sjtu@info@title,
      pdfsubject  = \sjtu@name@subject,
      pdfkeywords = \sjtu@info@keywords,
      pdfauthor   = \sjtu@info@author,
      pdfcreator  = {LaTeX with SJTUThesis \version}
    }
  }%
}
\AtEndOfPackageFile*{threeparttable}{
  \appto\TPTnoteSettings{\footnotesize}
}
\AtEndOfPackageFile*{siunitx}{
  \sisetup{
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
\newcommand\sjtu@def@theorem@name{%
  \ifsjtu@language@chinese
    \sjtu@name@def{assertion}{断言}
    \sjtu@name@def{assumption}{假设}
    \sjtu@name@def{axiom}{公理}
    \sjtu@name@def{corollary}{推论}
    \sjtu@name@def{definition}{定义}
    \sjtu@name@def{example}{例}
    \sjtu@name@def{lemma}{引理}
    \sjtu@name@def{proof}{证明}
    \sjtu@name@def{proposition}{命题}
    \sjtu@name@def{remark}{注}
    \sjtu@name@def{theorem}{定理}
  \else
    \sjtu@name@def{assertion}{Assertion}
    \sjtu@name@def{assumption}{Assumption}
    \sjtu@name@def{axiom}{Axiom}
    \sjtu@name@def{corollary}{Corollary}
    \sjtu@name@def{definition}{Definition}
    \sjtu@name@def{example}{Example}
    \sjtu@name@def{lemma}{Lemma}
    \sjtu@name@def{proof}{Proof}
    \sjtu@name@def{proposition}{Proposition}
    \sjtu@name@def{remark}{Remark}
    \sjtu@name@def{theorem}{Theorem}
  \fi
}
\newcommand\sjtu@def@theorem{%
  \newtheorem{theorem}             {\sjtu@name@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\sjtu@name@assertion}
  \newtheorem{axiom}      [theorem]{\sjtu@name@axiom}
  \newtheorem{corollary}  [theorem]{\sjtu@name@corollary}
  \newtheorem{lemma}      [theorem]{\sjtu@name@lemma}
  \newtheorem{proposition}[theorem]{\sjtu@name@proposition}
  \newtheorem{assumption}          {\sjtu@name@assumption} [chapter]
  \newtheorem{definition}          {\sjtu@name@definition} [chapter]
  \newtheorem{example}             {\sjtu@name@example}    [chapter]
  \newtheorem*{remark}             {\sjtu@name@remark}
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\AtEndOfPackageFile*{ntheorem}{
  \sjtu@def@theorem@name
  \theoremheaderfont{\hspace*{\sjtu@indent@headings@width}\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{\enskip}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\sjtu@name@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \sjtu@def@theorem
}
\AtEndOfPackageFile*{amsthm}{
  \sjtu@def@theorem@name
  \let\sjtu@thmhead\thmhead@plain
  \def\thmhead@plain{\hspace*{\sjtu@indent@headings@width}\sjtu@thmhead}
  \newtheoremstyle{sjtuplain}
    {}{}
    {\normalfont}{}
    {\bfseries\heiti}{}
    {\ccwd}{}
  \theoremstyle{sjtuplain}
  \sjtu@def@theorem
  \renewcommand\proofname\sjtu@name@proof
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
      {\hspace*{\sjtu@indent@headings@width}\bfseries\heiti #1~}
      \hspace\labelsep\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtEndOfPackageFile*{algorithm2e}{
  \SetAlgorithmName{\sjtu@name@algorithm}%
                   {\sjtu@name@algorithm}%
                   {\sjtu@name@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \def\listalgocfname{\listalgorithmcfname}
  \newlistof{alg}{loa}{\listalgocfname}
  \let\l@algocf\l@alg
  \setlength{\cftalgindent}{1.5em}
  \setlength{\cftalgnumwidth}{2.3em}
  \renewcommand\cftalgpresnum{\sjtu@name@algorithm~}
  \AtEndPreamble{%
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \renewcommand\listofalgorithms{\sjtu@listof{algocf}}
  \AtBeginDocument{%
   \renewcommand\thealgocf{\thechapter\sjtu@style@fl@num@sep\@arabic\c@algocf}
  }
}
\AtEndOfPackageFile*{algorithm}{
  \RequirePackage{algorithmicx, algpseudocode}
  \floatname{algorithm}{\sjtu@name@algorithm}
  \@addtoreset{algorithm}{chapter}
  \patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
      \if@twocolumn}
    {}{}
  \def\listalgorithmname{\sjtu@name@listalgorithm}
  \newlistof{alg}{loa}{\listalgorithmname}
  \let\l@algorithm\l@alg
  \setlength{\cftalgindent}{1.5em}
  \setlength{\cftalgnumwidth}{2.3em}
  \renewcommand\cftalgpresnum{\sjtu@name@algorithm~}
  \AtEndPreamble{%
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \renewcommand\listofalgorithms{\sjtu@listof{algorithm}}
  \AtBeginDocument{%
    \renewcommand\thealgorithm{\thechapter\sjtu@style@fl@num@sep\arabic{algorithm}}
  }
}
\AtEndOfPackageFile*{listings}{
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
}
\AtEndOfPackageFile*{tikz}{
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
