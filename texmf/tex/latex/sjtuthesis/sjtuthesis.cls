%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2021 by SJTUG
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
  [2021/06/03 1.1.0rc1 Shanghai Jiao Tong University Thesis Template]
\hyphenation{SJTU-Thesis}
\def\sjtuthesis{SJTU\textsc{Thesis}}
\def\version{1.1.0rc1}
\newcommand\sjtu@error[1]{%
  \ClassError{sjtuthesis}{#1}{}%
}
\newcommand\sjtu@warning[1]{%
  \ClassWarning{sjtuthesis}{#1}{}%
}
\RequirePackage{iftex}
\ifXeTeX\else
  \ifLuaTeX\else
    \sjtu@error{%
      The SJTUThesis class requires either XeTeX or LuaTeX.\\\\
      You must change your typesetting engine to, e.g.,
      "xelatex" or "lualatex" instead of "latex" or "pdflatex".
    }
  \fi
\fi
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
  type = {
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
}
\DeclareStringOption[termes]{text-font}
\@namedef{sjtu@text@font}{\csname sjtu@text-font\endcsname}
\DeclareStringOption[auto]{math-font}
\@namedef{sjtu@math@font}{\csname sjtu@math-font\endcsname}
\DeclareStringOption[auto]{cjk-font}
\@namedef{sjtu@cjk@font}{\csname sjtu@cjk-font\endcsname}
\DeclareBoolOption[false]{unimath}
\DeclareBoolOption[false]{nothm}
\DeclareBoolOption[false]{review}
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newif\ifsjtu@type@graduate
\sjtu@type@graduatefalse
\ifsjtu@type@doctor
  \sjtu@type@graduatetrue
\fi
\ifsjtu@type@master
  \sjtu@type@graduatetrue
\fi
\ifsjtu@zihao@auto
  \ifsjtu@type@graduate
    \def\sjtu@zihao{-4}
  \else
    \def\sjtu@zihao{5}
  \fi
\fi
\PassOptionsToClass{zihao=\sjtu@zihao}{ctexbook}
\ifsjtu@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
\ifsjtu@type@graduate\else
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{no-math,quiet}{fontspec}
\LoadClass[a4paper,UTF8,scheme=plain,fontset=none,linespread=1.3]{ctexbook}[2018/04/01]
\AtEndOfClass{
  \ifsjtu@type@graduate
    \input{sjtuthesis-graduate.ltx}
  \else
    \input{sjtuthesis-undergraduate.ltx}
  \fi
}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{filehook}
\RequirePackage{environ}
\RequirePackage{calc}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage,bottom]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{url}
\RequirePackage{silence}
\WarningFilter{pageslts}{Package pdfpages detected}
\newcommand\sjtu@package@conflict[2]{
  \AtEndOfPackageFile*{#1}{%
    \AtBeginOfPackageFile*{#2}{%
      \sjtu@error{The "#2" package is incompatible with "#1"}%
    }
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
\sjtu@package@conflict{unicode-math}{newtxmath}
\sjtu@package@conflict{unicode-math}{upgreek}
\sjtu@package@conflict{newtxmath}{amsfonts}
\sjtu@package@conflict{newtxmath}{amssymb}
\sjtu@package@conflict{newtxmath}{unicode-math}
\sjtu@package@conflict{newtxmath}{upgreek}
\newcommand\sjtu@patchcmd[3]{%
  \patchcmd{#1}{#2}{#3}{}%
    {\sjtu@warning{Oops! Command `\protect#1' is NOT patchable.}}
}
\kv@define@key{sjtu}{style}{
  \kvsetkeys{sjtu@style}{#1}
}
\sjtu@set@family@handler{sjtu@style}
\sjtu@define@key{sjtu@style}{
  header = {
    choices = {
      single,
      double,
    },
  },
  frontmatter-numbering = {
    name = frontmatter@numbering,
    choices = {
      true,
      false,
    },
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
  footnote = {
    choices = {
      indent,
      hang,
    },
  },
  title-logo-color = {
    name = title@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = red,
  },
  header-logo-color = {
    name = header@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = red,
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
  display-title   = { name = display@title@zh },
  display-title*  = { name = display@title@en },
  running-title   = { name = running@title@zh },
  running-title*  = { name = running@title@en },
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
  course          = { name = course@zh },
  course*         = { name = course@en },
  fund            = { name = fund@zh },
  fund*           = { name = fund@en },
  date            = {%
    initial = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}
\sjtu@option@hook{sjtu@info}{title}{%
  \ifx\sjtu@info@display@title@zh\@empty
    \global\let\sjtu@info@display@title@zh\sjtu@info@title@zh
  \fi
  \ifx\sjtu@info@running@title@zh\@empty
    \global\let\sjtu@info@running@title@zh\sjtu@info@title@zh
  \fi
}
\sjtu@option@hook{sjtu@info}{title*}{%
  \ifx\sjtu@info@display@title@en\@empty
    \global\let\sjtu@info@display@title@en\sjtu@info@title@en
  \fi
  \ifx\sjtu@info@running@title@en\@empty
    \global\let\sjtu@info@running@title@en\sjtu@info@title@en
  \fi
}
\newcommand\sjtu@clist@use[2]{%
  \let\sjtu@@tmp\@empty%
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
  \def\sjtu@info@title@sec{\sjtu@info@title@en}
  \def\sjtu@info@display@title{\sjtu@info@display@title@zh}
  \def\sjtu@info@running@title{\sjtu@info@running@title@zh}
  \def\sjtu@info@keywords{\sjtu@info@keywords@zh}
  \def\sjtu@info@author{\sjtu@info@author@zh}
\else
  \def\sjtu@info@title{\sjtu@info@title@en}
  \def\sjtu@info@title@sec{\sjtu@info@title@zh}
  \def\sjtu@info@display@title{\sjtu@info@display@title@en}
  \def\sjtu@info@running@title{\sjtu@info@running@title@en}
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
\newcommand\sjtu@date@format@en[3]{\sjtu@date@month@en{#2} \number#3, #1}
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
  abbreviation      = { initial = Abbreviation },
  nomenclature      = { initial = Nomenclature },
  summary           = { initial = Summary },
  bib               = { initial = Bibliography },
  index             = { initial = Index },
  acknowledgements  = { initial = Acknowledgements },
  publications      = { initial = Publications },
  achievements      = { initial = Research Achievements },
  resume            = { initial = Resume },
  digest            = { initial = Digest },
}
\newcommand\sjtu@name@def[2]{%
  \@namedef{sjtu@name@#1}{#2}
}
\sjtu@name@def{school@zh}{上海交通大学}
\sjtu@name@def{school@en}{Shanghai Jiao Tong University}
\ifsjtu@type@graduate
  \ifsjtu@type@doctor
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
  \sjtu@name@def{subject@zh}{%
    \sjtu@name@school@zh\sjtu@name@degree@type@zh\sjtu@name@thesis@type
  }
  \sjtu@name@def{subject@en}{%
    Dissertation Submitted to \sjtu@name@school@en \\
    for the Degree of \sjtu@name@degree@type@en
  }
\else
  \ifsjtu@type@course
    \sjtu@name@def{degree@type@zh}{}
    \sjtu@name@def{degree@type@en}{}
    \sjtu@name@def{thesis@type}{课程论文}
    \sjtu@name@def{subject@zh}{\sjtu@name@thesis@type}
    \sjtu@name@def{subject@en}{Course Paper}
  \else
    \sjtu@name@def{degree@type@zh}{学士}
    \sjtu@name@def{degree@type@en}{Bachelor}
    \sjtu@name@def{thesis@type}{学位论文}
    \sjtu@name@def{subject@zh}{\sjtu@name@degree@type@zh\sjtu@name@thesis@type}
    \sjtu@name@def{subject@en}{\sjtu@name@degree@type@en's Thesis}
  \fi
  \sjtu@name@def{author@zh}{学生姓名}
  \sjtu@name@def{id@zh}{学生学号}
  \sjtu@name@def{supervisor@zh}{指导教师}
  \sjtu@name@def{course@zh}{课程名称}
  \sjtu@name@def{major@zh}{专业}
  \sjtu@name@def{department@zh}{学院(系)}
\fi
\sjtu@name@def{orig@title@zh}{原创性声明}
\sjtu@name@def{orig@title@en}{Statement of Originality}
\sjtu@name@def{copr@title@zh}{使用授权书}
\sjtu@name@def{copr@title@en}{Copyright Permission}
\sjtu@name@def{orig@body}{%
  本人郑重声明：所呈交的\sjtu@name@thesis@type ，是本人在导师的指导下，独立进行
  研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集
  体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中
  以明确方式标明。本人完全意识到本声明的法律结果由本人承担。}
\sjtu@name@def{copr@body}{%
  本\sjtu@name@thesis@type 作者完全了解学校有关保留、使用\sjtu@name@thesis@type
  的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被
  查阅和借阅。}
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
      abbreviation      = {缩略语对照表},
      nomenclature      = {符号对照表},
      summary           = {全文总结},
      bib               = {参考文献},
      index             = {索\hspace{\ccwd}引},
      acknowledgements  = {致\hspace{\ccwd}谢},
      publications      = {攻读学位期间发表（或录用）的学术论文},
      achievements      = {攻读学位期间获得的科研成果},
      resume            = {个人简历},
      digest            = {大摘要},
    }
  }
  \ctexset{
    chapter/name    = {第,章},
    chapter/number  = \chinese{chapter},
  }
  \sjtu@name@def{titlepage}{扉页}
  \sjtu@name@def{subject}{\sjtu@name@subject@zh}
  \sjtu@name@def{copr@mk}{\sjtu@name@orig@title@zh 及\sjtu@name@copr@title@zh}
  \sjtu@name@def{abstract}{\sjtu@name@abstract@zh}
  \sjtu@name@def{assumption}{假设}
  \sjtu@name@def{axiom}{公理}
  \sjtu@name@def{conjecture}{猜想}
  \sjtu@name@def{corollary}{推论}
  \sjtu@name@def{definition}{定义}
  \sjtu@name@def{example}{例}
  \sjtu@name@def{exercise}{练习}
  \sjtu@name@def{lemma}{引理}
  \sjtu@name@def{problem}{问题}
  \sjtu@name@def{proof}{证明}
  \sjtu@name@def{proposition}{命题}
  \sjtu@name@def{remark}{注}
  \sjtu@name@def{solution}{解}
  \sjtu@name@def{theorem}{定理}
\else
  \sjtu@name@def{titlepage}{Title Page}
  \sjtu@name@def{subject}{\sjtu@name@subject@en}
  \sjtu@name@def{copr@mk}{\sjtu@name@orig@title@en and \sjtu@name@copr@title@en}
  \sjtu@name@def{abstract}{\sjtu@name@abstract@en}
  \sjtu@name@def{assumption}{Assumption}
  \sjtu@name@def{axiom}{Axiom}
  \sjtu@name@def{conjecture}{Conjecture}
  \sjtu@name@def{corollary}{Corollary}
  \sjtu@name@def{definition}{Definition}
  \sjtu@name@def{example}{Example}
  \sjtu@name@def{exercise}{Exercise}
  \sjtu@name@def{lemma}{Lemma}
  \sjtu@name@def{problem}{Problem}
  \sjtu@name@def{proof}{Proof}
  \sjtu@name@def{proposition}{Proposition}
  \sjtu@name@def{remark}{Remark}
  \sjtu@name@def{solution}{Solution}
  \sjtu@name@def{theorem}{Theorem}
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
\ifsjtu@unimath
  \RequirePackage{unicode-math}
\fi
\ifthenelse{\equal{\sjtu@math@font}{auto}}{
  \let\sjtu@math@font\sjtu@text@font
}{}
\ifthenelse{\equal{\sjtu@math@font}{none}}{}{%
  \InputIfFileExists{sjtu-math-font-\sjtu@math@font.def}{}{%
    \sjtu@warning{%
      Invalid value `math-font = \sjtu@math@font'! \MessageBreak
      Using `termes' instead.
    }
    \def\sjtu@math@font{termes}
    \input{sjtu-math-font-\sjtu@math@font.def}
  }
}
\ifthenelse{\equal{\sjtu@text@font}{none}}{}{%
  \InputIfFileExists{sjtu-text-font-\sjtu@text@font.def}{}{%
    \sjtu@warning{%
      Invalid value `text-font = \sjtu@text@font'! \MessageBreak
      Using `termes' instead.
    }
    \def\sjtu@text@font{termes}
    \input{sjtu-text-font-\sjtu@text@font.def}
  }
}
\ifthenelse{\equal{\sjtu@cjk@font}{auto}}{
  \IfFontExistsTF{SimSun}{
    \def\sjtu@cjk@font{windows}
  }{
    \IfFileExists{/System/Library/Fonts/Menlo.ttc}{
      \def\sjtu@cjk@font{mac}
    }{
      \IfFontExistsTF{Noto Serif CJK SC}{
        \def\sjtu@cjk@font{ubuntu}
      }{
        \def\sjtu@cjk@font{fandol}
      }
    }
  }
}{}
\ifthenelse{\equal{\sjtu@cjk@font}{none}}{}{%
  \InputIfFileExists{sjtu-cjk-font-\sjtu@cjk@font.def}{}{%
    \sjtu@warning{%
      Invalid value `cjk-font = \sjtu@cjk@font'! \MessageBreak
      Using `fandol' instead.
    }
    \def\sjtu@cjk@font{fandol}
    \input{sjtu-cjk-font-\sjtu@cjk@font.def}
  }
}
\ifXeTeX
  \xeCJKDeclareCharClass{CJK}{"24EA,"2460->"2473,"3251->"32BF,"25A1}
\fi
\ifLuaTeX
  \ltjdefcharrange{100}{"24EA,"2460-"2473,"3251-"32BF,"25A1}
  \ltjsetparameter{jacharrange={+100}}
\fi
\newcommand\sjtu@square{\symbol{"25A1}}
\newcommand\sjtu@colon{\makebox[1\ccwd]{\symbol{"FF1A}}}
\def\sjtu@thepage{}
\def\sjtu@lastpageref{}
\newif\ifsjtu@page@numbering \sjtu@page@numberingtrue
\AtEndOfClass{%
  \sloppy
  \raggedbottom
}
\sjtu@patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
\sjtu@patchcmd\chapter%
  {\thispagestyle}{\@gobble}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifsjtu@style@frontmatter@numbering@false
    \sjtu@page@numberingfalse
  \fi
  \pagenumbering{Roman}
  \def\sjtu@thepage{\thepage}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.Roman}}
  \pagestyle{plain}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \sjtu@page@numberingtrue
  \sjtu@set@float@fontsizetrue
  \pagenumbering{arabic}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.arabic}}
}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \@mainmatterfalse
}
\ctexset{%
  chapter = {%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    fixskip      = true,
    beforeskip   = 24pt,
    afterskip    = 24pt,
    lofskip      = 0pt,
    lotskip      = 0pt,
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
\newlength{\sjtu@headings@indent@fixed}
\setlength{\sjtu@headings@indent@fixed}{2\ccwd}
\newcommand\sjtu@style@set@indent@headings{%
  \ifsjtu@style@indent@headings@fixed
    \sjtu@style@indent@headings@autotrue
    \gdef\sjtu@headings@indent{\sjtu@headings@indent@fixed}
  \else
    \gdef\sjtu@headings@indent{2\ccwd}
  \fi
  \ifsjtu@style@indent@headings@auto
    \ifsjtu@type@graduate\relax\else
      \ctexset{%
        subsubsection/name   = {(,)},
        subsubsection/number = \arabic{subsubsection},
      }
    \fi
  \else
    \gdef\sjtu@headings@indent{\z@}
    \ctexset{%
      subsubsection/name   = {},
      subsubsection/number = \thesubsubsection,
    }
  \fi
  \ctexset{%
    section/indent       = \sjtu@headings@indent,
    subsection/indent    = \sjtu@headings@indent,
    subsubsection/indent = \sjtu@headings@indent,
  }
}
\sjtu@style@set@indent@headings
\sjtu@option@hook{sjtu@style}{indent-headings}{%
  \sjtu@style@set@indent@headings
}
\newcommand\sjtu@indent@box{%
  \hspace*{\ifsjtu@style@indent@headings@auto 2\ccwd\else\z@\fi}%
}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true,
}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\let\footnotemarkfont\@empty
\def\sjtu@num@circled#1{%
  \ifnum#1 <21%
    {\footnotemarkfont\symbol{\the\numexpr#1+"245F\relax}}%
  \else\ifnum#1 <36%
    {\footnotemarkfont\symbol{\the\numexpr#1+"323C\relax}}%
  \else\ifnum#1 <51%
    {\footnotemarkfont\symbol{\the\numexpr#1+"328D\relax}}%
  \else
    \sjtu@warning{Too many footnotes in this page.}%
  \fi\fi\fi
}
\renewcommand{\thefootnote}{\sjtu@num@circled{\c@footnote}}
\renewcommand{\thempfootnote}{\sjtu@num@circled{\c@mpfootnote}}
\footnotemargin1.5em\relax
\long\def\@makefntext#1{%
  \ifsjtu@style@footnote@hang
    \bgroup
    \def\@makefnmark{\hbox{\normalfont\@thefnmark}}%
    \setbox\@tempboxa\hbox{%
      \ifdim\footnotemargin>\z@
        \hb@xt@\footnotemargin{\@makefnmark\hss}%
      \else
        \@makefnmark
      \fi
    }%
    \leftmargin\wd\@tempboxa
    \rightmargin\z@
    \linewidth \columnwidth
    \advance \linewidth -\leftmargin
    \parshape \@ne \leftmargin \linewidth
    \footnotesize
    \@setpar{{\@@par}}%
    \leavevmode
    \llap{\box\@tempboxa}%
    \parskip\hangfootparskip\relax
    \parindent\hangfootparindent\relax
  \else
    \parindent 2\ccwd%
    {\normalfont\@thefnmark}
  \fi
  \footnotelayout#1%
  \ifsjtu@style@footnote@hang
    \par\egroup
  \fi
}
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
    \ifthenelse{\equal{#4}{}}{}{%
      \sjtu@pdfbookmark{0}{#4}%
    }
  }{%
    \sjtu@phantomsection
    \addcontentsline{toc}{chapter}{#4}%
  }%%
  \chapter*{#3}%
  \@mkboth{\MakeUppercase{#2}}{\MakeUppercase{#2}}%
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
    {\sjtu@chapter*{\csname list#1name\endcsname}
     \@starttoc{\csname ext@#1\endcsname}}%
    {\sjtu@chapter{\csname list#1name\endcsname}
     \@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{\sjtu@listof{figure}}
\renewcommand\listoftables{\sjtu@listof{table}}
\ifsjtu@language@chinese
  \renewcommand\cftdot{\textperiodcentered}
\fi
\renewcommand\cftdotsep{1}
\setlength{\cftbeforechapskip}{0pt}
\renewcommand\cftchappagefont{\normalfont}
\renewcommand\cftchapleader{\normalfont\cftdotfill{\cftdotsep}}
\renewcommand\cftfigpresnum{\sjtu@name@figure~}
\renewcommand\cfttabpresnum{\sjtu@name@table~}
\AtEndPreamble{%
  \addtolength{\cftfignumwidth}{\widthof{\cftfigpresnum}}
  \addtolength{\cfttabnumwidth}{\widthof{\cfttabpresnum}}
}
\renewcommand\textfraction{0.15}
\renewcommand\topfraction{0.85}
\renewcommand\bottomfraction{0.65}
\renewcommand\floatpagefraction{0.60}
\AtBeginDocument{%
  \def\thefigure{\thechapter\sjtu@style@fl@num@sep\arabic{figure}}
  \def\p@subfigure{\thefigure}
  \def\thetable{\thechapter\sjtu@style@fl@num@sep\arabic{table}}
  \def\theequation{\thechapter\sjtu@style@eq@num@sep\arabic{equation}}
}
\newcommand\sjtu@counter@without@chapter{
  \counterwithout{section}{chapter}
  \setcounter{section}{0}
  \counterwithout{figure}{chapter}
  \setcounter{figure}{0}
  \counterwithout{table}{chapter}
  \setcounter{table}{0}
}
\newif\ifsjtu@set@float@fontsize \sjtu@set@float@fontsizefalse
\sjtu@patchcmd\@floatboxreset%
  {\normalsize}
  {\ifsjtu@set@float@fontsize\zihao{5}\else\normalsize\fi}
\NewDocumentCommand{\SJTUsetfloatfontsize}{}{\sjtu@set@float@fontsizetrue}
\NewDocumentCommand{\SJTUunsetfloatfontsize}{}{\sjtu@set@float@fontsizefalse}
\ifsjtu@type@graduate
  \DeclareCaptionFont{sjtu@caption@font}{\zihao{5}\kaishu}
\else
  \DeclareCaptionFont{sjtu@caption@font}{\zihao{5}\bfseries}
\fi
\DeclareCaptionFont{sjtu@subcaption@font}{\zihao{5}\normalfont}
\DeclareCaptionLabelSeparator{enskip}{\enskip}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = enskip,
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
  \def\figurename{\sjtu@name@figure@second}
}
\captionsetup[bi-second]{bi-second}
\newcommand\sjtu@copr@addon{%
  \noindent
  本\sjtu@name@thesis@type 属于\enskip
  \begin{minipage}[t]{28\ccwd}
    \sjtu@square{\bfseries 公开论文} \par
    \sjtu@square{\bfseries 内部论文}，%
      \sjtu@square 1 年/\sjtu@square 2 年/\sjtu@square 3 年\quad%
      解密后适用本授权书。\par
    \sjtu@square{\bfseries 秘密论文}，\underline{\hspace{2\ccwd}}年%
      （不超过10年）解密后适用本授权书。\par
    \sjtu@square{\bfseries 机密论文}，\underline{\hspace{2\ccwd}}年%
      （不超过20年）解密后适用本授权书。\par
    （请在以上方框内打“$\checkmark$”）
  \end{minipage}
}
\newcommand\sjtu@signbox[1]{%
  \begingroup
  \zihao{4}
  \parbox[t]{64mm}{%
    {#1}签名：\\[6pt]
    日期：\hspace{\stretch{3}}年\hspace{\stretch{2}}月\hspace{\stretch{2}}日
  }
  \endgroup
}
\NewDocumentCommand{\copyrightpage}{O{}}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \sjtu@pdfbookmark{0}{\sjtu@name@copr@mk}%
    \ifblank{#1}{%
      \newgeometry{
        vmargin = 3cm,
        left    = 3cm,
        right   = 2.5cm,
      }%
      \thispagestyle{empty}
      \begingroup
        \zihao{-4}\linespread{1.73}\selectfont
        \begin{center}
          \heiti\zihao{3}
          \sjtu@name@school@zh\par
          \sjtu@name@thesis@type\sjtu@name@orig@title@zh
        \end{center}\par
        \sjtu@name@orig@body\par
        \vskip \baselineskip \hfill
        \sjtu@signbox{\sjtu@name@thesis@type 作者}
        \hspace*{20mm}\par
        \vskip 2\baselineskip
        \begin{center}
          \heiti\zihao{3}
          \sjtu@name@school@zh\par
          \sjtu@name@thesis@type\sjtu@name@copr@title@zh
        \end{center}\par
        \sjtu@name@copr@body\par
        \vskip \baselineskip
        \sjtu@copr@addon\par
        \vskip 1.5\baselineskip
        \sjtu@signbox{\sjtu@name@thesis@type 作者}\hfill
        \sjtu@signbox{指导教师}\par
        \endgroup
      \restoregeometry
    }{\includepdf[pages=-]{#1}}
  \fi
}
\newcommand\sjtu@save@env@body[1]{\long\gdef\sjtu@saved@env@body{#1}}
\NewDocumentEnvironment{abbreviation}{}{%
  \sjtu@chapter{\sjtu@name@abbreviation}
}{}
\NewDocumentEnvironment{abbreviation*}{}{%
  \sjtu@chapter*{\sjtu@name@abbreviation}
}{}
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
\NewDocumentEnvironment{digest}{}{%
  \Collect@Body\sjtu@save@env@body
}{%
  \ifsjtu@type@bachelor
    \AtEndDocument{%
      \cleardoublepage
      \pagenumbering{roman}
      \def\sjtu@thepage{\theCurrentPageLocal}
      \def\sjtu@lastpageref{\lastpageref{pagesLTS.roman.local}}
      \sjtu@chapter*[\sjtu@name@digest]{\MakeUppercase\sjtu@info@title@sec}
      \sjtu@counter@without@chapter
      \let\addcontentsline\@gobblethree
      \sjtu@saved@env@body
    }
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
\newcommand\sjtu@title@box[2][]{%
  \def\sjtu@@title@uline{\rule[-1ex]{#1}{.5pt}}%
  \def\sjtu@@title@box##1{\parbox[t]{#1}{##1}}%
  \newlength\sjtu@@title@temp@ht
  \settototalheight\sjtu@@title@temp@ht{\sjtu@@title@box{#2}}%
  \ifdim\sjtu@@title@temp@ht=0pt%
    \sjtu@@title@uline%
  \else
    \leavevmode%
    \ifdim\sjtu@@title@temp@ht>\normalbaselineskip
      \rlap{\smash{\sjtu@@title@box{%
        \@whiledim\sjtu@@title@temp@ht>0pt%
        \leavevmode%
        \do{%
          \rlap{\sjtu@@title@uline}\\%
          \addtolength\sjtu@@title@temp@ht{-\normalbaselineskip}%
        }%
      }}}%
      \sjtu@@title@box{\centering #2}%
    \else
      \rlap{\sjtu@@title@uline}%
      \sjtu@@title@box{\centering #2}%
    \fi
  \fi
}
\newcolumntype{F}[2]{%
  >{\minipage[#1]{#2}%
    \ifXeTeX\def\CJKglue{\hskip \z@ plus 1filll}\fi%
    \ifLuaTeX\ltjsetparameter{kanjiskip=\z@ plus 1filll}\fi%
    \begingroup}%
    c%
  <{\endgroup%
    \endminipage%
    \ignorespacesafterend}}
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
\AtEndOfPackageFile*{longtable}{
  \BeforeBeginEnvironment{longtable}
    {\begingroup\ifsjtu@set@float@fontsize\zihao{5}\fi}
  \AfterEndEnvironment{longtable}
    {\endgroup}
}
\AtEndOfPackageFile*{unicode-math}{
  \unimathsetup{
    math-style = ISO,
    bold-style = ISO,
    nabla      = upright,
  }
  \newcommand{\bm}{\symbf}
  \renewcommand{\boldsymbol}{\symbf}
  \newcommand{\square}{\mdlgwhtsquare}
}
\AtEndOfPackageFile*{physics}{
  \@ifundefined{updelta}{}{
    \DeclareDocumentCommand\variation{o g d()}{
      \IfNoValueTF{#2}{
        \IfNoValueTF{#3}
          {\updelta \IfNoValueTF{#1}{}{^{#1}}}
          {\mathinner{\updelta \IfNoValueTF{#1}{}{^{#1}}\argopen(#3\argclose)}}
        }
        {\mathinner{\updelta \IfNoValueTF{#1}{}{^{#1}}#2} \IfNoValueTF{#3}{}{(#3)}}
    }
  }
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
\newcommand\sjtu@def@theorem{%
  \newtheorem{assumption} {\sjtu@name@assumption} [chapter]
  \newtheorem{axiom}      {\sjtu@name@axiom}      [chapter]
  \newtheorem{conjecture} {\sjtu@name@conjecture} [chapter]
  \newtheorem{corollary}  {\sjtu@name@corollary}  [chapter]
  \newtheorem{definition} {\sjtu@name@definition} [chapter]
  \newtheorem{example}    {\sjtu@name@example}    [chapter]
  \newtheorem{exercise}   {\sjtu@name@exercise}   [chapter]
  \newtheorem{lemma}      {\sjtu@name@lemma}      [chapter]
  \newtheorem{problem}    {\sjtu@name@problem}    [chapter]
  \newtheorem{proposition}{\sjtu@name@proposition}[chapter]
  \newtheorem{theorem}    {\sjtu@name@theorem}    [chapter]
  \newtheorem*{remark}    {\sjtu@name@remark}
  \newtheorem*{solution}  {\sjtu@name@solution}
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\AtEndOfPackageFile*{ntheorem}{
  \theoremheaderfont{\sjtu@indent@box\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{\enskip}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\sjtu@name@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \ifsjtu@nothm\else
    \sjtu@def@theorem
  \fi
}
\AtBeginOfPackageFile*{amsthm}{
  \newif\ifsjtu@openbox@defined
  \@ifundefined{openbox}{
    \sjtu@openbox@definedfalse
  }{
    \sjtu@openbox@definedtrue
    \let\oldopenbox\openbox
    \let\openbox\@undefined
  }
}
\AtEndOfPackageFile*{amsthm}{
  \ifsjtu@openbox@defined
    \let\openbox\oldopenbox
  \fi
  \let\sjtu@thmhead\thmhead@plain
  \def\thmhead@plain{\sjtu@indent@box\sjtu@thmhead}
  \newtheoremstyle{sjtuplain}
    {}{}
    {\normalfont}{}
    {\bfseries\heiti}{}
    {\ccwd}{}
  \theoremstyle{sjtuplain}
  \ifsjtu@nothm\else
    \sjtu@def@theorem
  \fi
  \renewcommand\proofname\sjtu@name@proof
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
      {\sjtu@indent@box\bfseries\heiti #1~}
      \hspace\labelsep\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtBeginOfPackageFile*{algorithm2e}{
  \let\old@chapter\@chapter
}
\AtEndOfPackageFile*{algorithm2e}{
  \let\@chapter\old@chapter
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
  \apptocmd{\sjtu@counter@without@chapter}{%
    \counterwithout{algocf}{chapter}
    \setcounter{algocf}{0}
  }{}{}
  \sjtu@patchcmd\algocf@latexcaption%
    {\addcontentsline}
    {\caption@iflist{\addcontentsline}{\@gobblethree}}
  \AtEndPreamble{%
    \addtolength{\cftalgnumwidth}{\widthof{\cftalgpresnum}}
  }
  \renewcommand\listofalgorithms{\sjtu@listof{algocf}}
  \AtBeginDocument{%
    \def\thealgocf{\thechapter\sjtu@style@fl@num@sep\arabic{algocf}}
  }
}
\PassOptionsToPackage{chapter}{algorithm}
\AtEndOfPackageFile*{algorithm}{
  \floatname{algorithm}{\sjtu@name@algorithm}
  \def\listalgorithmname{\sjtu@name@listalgorithm}
  \newlistof{alg}{loa}{\listalgorithmname}
  \let\l@algorithm\l@alg
  \setlength{\cftalgindent}{1.5em}
  \setlength{\cftalgnumwidth}{2.3em}
  \renewcommand\cftalgpresnum{\sjtu@name@algorithm~}
  \apptocmd{\sjtu@counter@without@chapter}{%
    \counterwithout{algorithm}{chapter}
    \setcounter{algorithm}{0}
  }{}{}
  \AtEndPreamble{%
    \addtolength{\cftalgnumwidth}{\widthof{\cftalgpresnum}}
  }
  \renewcommand\listofalgorithms{\sjtu@listof{algorithm}}
  \AtBeginDocument{%
    \def\thealgorithm{\thechapter\sjtu@style@fl@num@sep\arabic{algorithm}}
  }
}
\AtEndOfPackageFile*{listings}{
  \lstdefinestyle{lstStyleCode}{
    aboveskip=\medskipamount,
    belowskip=\medskipamount,
    basicstyle=\ttfamily\zihao{6},
    commentstyle=\slshape\color{black!60},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    extendedchars=false,
    upquote=true,
    tabsize=2,
    showstringspaces=false,
    xleftmargin=1em,
    xrightmargin=1em,
    breaklines=false,
    framexleftmargin=1em,
    framexrightmargin=1em,
    backgroundcolor=\color{gray!10},
    columns=flexible,
    keepspaces=true,
    texcl=true,
    mathescape=true
  }
}
\endinput
%%
%% End of file `sjtuthesis.cls'.
