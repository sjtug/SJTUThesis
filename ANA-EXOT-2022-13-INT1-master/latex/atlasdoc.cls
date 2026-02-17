%-------------------------------------------------------------------------------
% Template class for ATLAS documents.
%
% See CHANGELOG.md or Git log for history of changes.
% Responsible: Ian Brock (ian.brock@cern.ch)
%
% Note that this file can be overwritten when atlaslatex is updated.
% If TeX Live 2014 is used and xpatch is needed, have to load mhchem first.
%
% Copyright (C) 2002-2021 CERN for the benefit of the ATLAS collaboration.
%-------------------------------------------------------------------------------
\newcommand*{\ATPackageVersion}{11.6.0}
\ProvidesClass{latex/atlasdoc}[2021/08/20 v11.6.0 ATLAS document class]
% Needs 2013 TeX Live or later
\NeedsTeXFormat{LaTeX2e}[2013/01/01]

%-------------------------------------------------------------------------------
% More advanced if syntax
\RequirePackage{ifthen}
% More advanced command definition
\RequirePackage{xparse}
% Process options. Use kvoptions package.
\RequirePackage{kvoptions}
%\RequirePackage[debugshow]{kvoptions}
\SetupKeyvalOptions{
  family=ADOC,
  prefix=ADOC@
}
\DeclareBoolOption[true]{atlasstyle}
\DeclareBoolOption[true]{atlasdraft}
\DeclareBoolOption[false]{coverpage}
\DeclareBoolOption[false]{cernpreprint}
\DeclareBoolOption[false]{preprint}
\DeclareBoolOption[true]{NOTE}
\DeclareBoolOption[false]{PAPER}
\DeclareBoolOption[false]{CONF}
\DeclareBoolOption[false]{PUB}
\DeclareBoolOption[false]{BOOK}
\DeclareBoolOption[false]{HEPDATA}
\DeclareBoolOption[false]{LANGEDIT}
\DeclareBoolOption[true]{LANGSHOW}
\DeclareStringOption[2016]{texlive}
\DeclareStringOption[a4]{paper}
\DeclareStringOption[normal]{titlesize}
\DeclareStringOption[\subsectiontocdepth]{tocdepth}
\DeclareBoolOption[true]{floatopt}
\DeclareBoolOption[true]{tableheading}
\DeclareBoolOption[true]{mathlines}
\DeclareBoolOption[true]{linenofix}
\DeclareBoolOption[true]{texmf}
\DeclareBoolOption[true]{newtx}
\DeclareBoolOption[false]{txfonts}
\DeclareBoolOption[false]{libertine}
\DeclareBoolOption[false]{palatino}
\DeclareBoolOption[false]{mhchem}
\DeclareBoolOption[true]{abstract}
\DeclareBoolOption[true]{atlaslogo}
\DeclareBoolOption[true]{cernlogo}
\DeclareBoolOption[true]{datetop}
\DeclareBoolOption[false]{showframe}
\DeclareBoolOption[false]{shownote}
\DeclareStringOption[0pt]{titleextraheight}
\DeclareStringOption[0pt]{copyrightoffset}
\ProcessKeyvalOptions{ADOC}

% Macro without @ for TeX Live version.
\newcommand*{\ATTeXLiveVersion}{\ADOC@texlive}

\newif\ifADOC@CONFnote
\newif\ifADOC@PUBnote
\newif\ifADOC@notenumber

% CERN preprint or auxiliary material.
\ifthenelse{\boolean{ADOC@cernpreprint}}{%
  \ADOC@HEPDATAfalse
  \ADOC@atlasdraftfalse
}{%
  \ifthenelse{\boolean{ADOC@preprint}}{%
    \ADOC@cernpreprinttrue
    \ADOC@HEPDATAfalse
  }{%
    \ifthenelse{\boolean{ADOC@HEPDATA}}{\ADOC@cernpreprintfalse}{}
  }
}

% Directory for style files
% \ifADOC@texmf
%   \providecommand*{\ATLASLATEXPATH}{}
% \else
%   \providecommand*{\ATLASLATEXPATH}{latex/}
% \fi

% Type of document
\newcommand*{\ADOC@docheadingdefault}{}
% Add ability to change draft document heading
\newcommand*{\ADOC@docheading}{}
\newcommand*{\AtlasHeading}[1]{\renewcommand*{\ADOC@docheading}{#1}}

% Turn off backref in atlasbiblatex for CERN preprint
\newcommand*{\ADOC@atlasbiblatex}{atlasbiblatex}
\newcommand*{\ADOC@atlasphysics}{atlasphysics}
% CERN preprint
\ifthenelse{\boolean{ADOC@cernpreprint}}{%
  \typeout{atlasdoc: ATLAS CERN preprint}
  \renewcommand*{\ADOC@docheadingdefault}{ATLAS Paper}
  \ADOC@PAPERtrue
  \ADOC@NOTEfalse
  \ADOC@CONFnotefalse
  \ADOC@PUBnotefalse
  \ADOC@BOOKfalse
  \typeout{atlasdoc: turning off backref for a CERN preprint}
  \PassOptionsToPackage{backref=false}{\ADOC@atlasbiblatex}
}{%
  % ATLAS paper
  \ifthenelse{\boolean{ADOC@PAPER}}{%
    \typeout{atlasdoc: ATLAS paper}
    \renewcommand*{\ADOC@docheadingdefault}{ATLAS Paper}
    \ADOC@PAPERtrue
    \ADOC@NOTEfalse
    \ADOC@CONFnotefalse
    \ADOC@PUBnotefalse
    \ADOC@BOOKfalse
  }{%
    % ATLAS CONF note
    \ifthenelse{\boolean{ADOC@CONF}}{%
      \typeout{atlasdoc: ATLAS CONF note}
      \renewcommand*{\ADOC@docheadingdefault}{ATLAS CONF Note}
      \ADOC@PAPERfalse
      \ADOC@NOTEfalse
      \ADOC@CONFnotetrue
      \ADOC@PUBnotefalse
      \ADOC@BOOKfalse
    }{%
      % ATLAS PUB note
      \ifthenelse{\boolean{ADOC@PUB}}{%
        \typeout{atlasdoc: ATLAS PUB note}
        \renewcommand*{\ADOC@docheadingdefault}{ATLAS PUB Note}
        \ADOC@PAPERfalse
        \ADOC@NOTEfalse
        \ADOC@CONFnotefalse
        \ADOC@PUBnotetrue
        \ADOC@BOOKfalse
      }{%
        % ATLAS TDR etc.
        \ifthenelse{\boolean{ADOC@BOOK}}{%
          \typeout{atlasdoc: ATLAS BOOK}
          \ADOC@PAPERfalse
          \ADOC@NOTEfalse
          \ADOC@CONFnotefalse
          \ADOC@PUBnotefalse
          \ADOC@BOOKtrue
        }{%
          \typeout{atlasdoc: ATLAS Note}
          \renewcommand*{\ADOC@docheadingdefault}{ATLAS Note}
        }
      }
    }
  }
}

% Decide on the main class
\ifthenelse{\boolean{ADOC@BOOK}}{%
  \typeout{atlasdoc: use KOMA-Script scrbook class}
  \newcommand*{\ADOC@mainclass}{scrbook}
}{%
  \typeout{atlasdoc: use KOMA-Script scrartcl class}
  \newcommand*{\ADOC@mainclass}{scrartcl}
}

% Set paper size
% \ifthenelse{\equal{\ADOC@paper}{}}{%
%   \newcommand*{\ADOC@paperstring}{paper=a4}
%   \PassOptionsToClass{a4paper}{\ADOC@mainclass}
%   \typeout{atlasdoc: paper size set to default A4}
% }{%
%   \newcommand*{\ADOC@paperstring}{paper=\ADOC@paper}
%   \PassOptionsToClass{\ADOC@paper}{\ADOC@mainclass}
%   \typeout{atlasdoc: paper size is \ADOC@paper, string for class is \ADOC@paperstring}
% }

% Option to reduce font sizes on title page
\ifthenelse{\equal{\ADOC@titlesize}{small}}{%
  \newcommand*{\ADOC@maintitlesize}{\LARGE}
  \newcommand*{\ADOC@authorsize}{\large}
  \newcommand*{\ADOC@abstractsize}{\small}
}{%
  \newcommand*{\ADOC@maintitlesize}{\huge}
  \newcommand*{\ADOC@authorsize}{\Large}
  \newcommand*{\ADOC@abstractsize}{\normalsize}
}

% ATLAS draft heading text
\newcommand*{\ADOC@draftheading}{ATLAS DRAFT}
\newcommand*{\AtlasDraftHeading}[1]{\renewcommand*{\ADOC@draftheading}{#1}}

% Set up command for authors and ORCID
\NewDocumentCommand \AtlasOrcid { o m } {%
  \IfNoValueTF {#1} {%
    #2%
  }{%
    \href{https://orcid.org/#1}{#2}%
  }%
}

% For final version of PUB notes turn off the note number by default
\ifthenelse{\boolean{ADOC@PUBnote}}{%
  \ifthenelse{\boolean{ADOC@atlasdraft} \OR \boolean{ADOC@shownote}}{%
    \ADOC@notenumbertrue
  }{%
    \typeout{atlasdoc: turning off note number of final version of PUB note}
    \ADOC@notenumberfalse
  }
}{%
  \ADOC@notenumbertrue
}

%-------------------------------------------------------------------------------
% Defaults for title page

% If statements for checking if things are defined.
\newif\ifADOC@abstract
\newif\ifACOV@support

% Any additions here that affect the cover page should also be added to atlascover.sty
% and to atlasmetadefs.sty.
\renewcommand{\@title}{Dummy title in atlasdoc\\ Use \textbackslash AtlasTitle to set it}
\newcommand{\AtlasTitleText}{Dummy AtlasTitle in atlasdoc\\ Use \textbackslash AtlasTitle to set it}
\newcommand{\AtlasTitle}[1]{%
  \title{#1}%
  \renewcommand{\AtlasTitleText}{#1}%
}
\author{The ATLAS Collaboration}
\date{\today}

% Draft version
\newcommand*{\ADOC@draftversion}{}
\newcommand*{\draftversion}[1]{\renewcommand*{\ADOC@draftversion}{#1}}
\newcommand*{\AtlasVersion}[1]{\renewcommand*{\ADOC@draftversion}{#1}}

% ATLAS reference code - empty by default
% Also create variable with web page
\newcommand*{\ADOC@refcode}{}
\newcommand*{\AtlasRefCode}[1]{\renewcommand*{\ADOC@refcode}{#1}}
\newcommand*{\AtlasPaperWebpage}{https://atlas.web.cern.ch/Atlas/GROUPS/PHYSICS/PAPERS/\ADOC@refcode}

% ATLAS note number
\newcommand*{\ADOC@atlasnote}{}
\newcommand*{\AtlasNote}[1]{\renewcommand*{\ADOC@atlasnote}{#1}}

% ATLAS date - arXiv submission; to be filled in by the Physics Office
\newcommand*{\ADOC@atlasdate}{\today}
\newcommand*{\AtlasDate}[1]{\renewcommand*{\ADOC@atlasdate}{#1}}

% Journal
\newcommand*{\ADOC@journal}{}
\newcommand*{\AtlasJournal}[1]{\renewcommand*{\ADOC@journal}{#1}}
\newcommand*{\journal}[1]{\renewcommand*{\ADOC@journal}{#1}}

% Preprint
\newcommand*{\ADOC@preprintnumber}{}
\newcommand*{\PreprintIdNumber}[1]{\renewcommand*{\ADOC@preprintnumber}{#1}}

% Journal reference
\newcommand*{\ADOC@journalref}{}
\newcommand*{\AtlasJournalRef}[1]{\renewcommand*{\ADOC@journalref}{#1}}

% DOI
\newcommand*{\ADOC@doi}{}
\newcommand*{\AtlasDOI}[1]{\renewcommand*{\ADOC@doi}{#1}}

% arXiv
\newcommand*{\AtlasArXivId}{}
\newcommand*{\AtlasArXivURL}{}
\newcommand*{\arXivId}[1]{\renewcommand*{\AtlasArXivId}{#1}\renewcommand*{\AtlasArXivURL}{http://arXiv.org/abs/#1}}
\newcommand*{\AtlasArXivCat}{[hep-ex]}

% HEP Data
\newcommand*{\AtlasHepDataRecord}{}
\newcommand*{\HepDataRecord}[1]{\renewcommand*{\AtlasHepDataRecord}{http://hepdata.cedar.ac.uk/view/ins#1}}

% Submission details
\newcommand*{\ADOC@subprepend}{Journal:}
\newcommand*{\subprepend}[1]{\renewcommand*{\ADOC@subprepend}{#1}}

% Abstract text
\newcommand{\AtlasAbstractText}{}
\newcommand{\AtlasAbstract}[1]{\ADOC@abstracttrue\renewcommand{\AtlasAbstractText}{#1}}
\newcommand{\abstracttext}[1]{\ADOC@abstracttrue\renewcommand{\AtlasAbstractText}{#1}}

% Extra macros needs for the cover page - define them here to avoid need for atlasmetadefs.sty
% This also avoids problems wth automatically generated metadata files
\newcommand*{\ACOV@CommentsDeadline}{Comments deadline}
\newcommand{\AtlasCoverCommentsDeadline}[1]{\renewcommand*{\ACOV@CommentsDeadline}{#1}}

\newcommand*{\ACOV@AnalysisTeam}{Analysis team}
\newcommand{\AtlasCoverAnalysisTeam}[1]{\renewcommand*{\ACOV@AnalysisTeam}{#1}}

\newcommand*{\ACOV@EgroupEditors}{Editor egroup}
\newcommand{\AtlasCoverEgroupEditors}[1]{\renewcommand*{\ACOV@EgroupEditors}{#1}}

\newcommand*{\ACOV@EgroupEdBoard}{EdBoard egroup}
\newcommand{\AtlasCoverEgroupEdBoard}[1]{\renewcommand*{\ACOV@EgroupEdBoard}{#1}}

% Multiple corresponding editors
% \newcommand{\ACOV@Editors}{}
% \newcommand{\AtlasCoverEditor}[2]{%
%   \g@addto@macro\ACOV@Editors{%
%     #1 & (\texttt{#2}) \\
%   }%
% }

% EdBoard members
\newcommand{\ACOV@EdBoardMembers}{}
\newcommand{\AtlasCoverEdBoardMember}[1]{%
  \g@addto@macro\ACOV@EdBoardMembers{%
    #1\par
  }%
}

% Readers (for PUB notes)
\newcommand{\ACOV@ReaderMembers}{}
\newcommand{\AtlasCoverReaderMember}[1]{%
  \g@addto@macro\ACOV@ReaderMembers{%
    #1\par
  }%
}

% Language editor
\newcommand*{\ACOV@LangEditor}{language editor contact}
\newcommand{\LEcontact}[1]{\renewcommand*{\ACOV@LangEditor}{#1}}

\ACOV@supportfalse
\newcommand*{\ACOV@TwikiURL}{}
\newcommand{\AtlasCoverTwikiURL}[1]{\ACOV@supporttrue\renewcommand*{\ACOV@TwikiURL}{\url{#1}}}

% Supporting note list
\newcommand{\ACOV@Notes}{}
\newcommand{\AtlasCoverSupportingNote}[2]{\ACOV@supporttrue%
%  \ifx\ACOV@Notes\@empty
%    \g@addto@macro\ACOV@Notes{\begin{tabular}{ll}}
%  \fi
  \g@addto@macro\ACOV@Notes{%
    #1: \url{#2}\newline
  }%
}


%-------------------------------------------------------------------------------
% Invoke main class
% Note that \KOMAoptions is not available in versions of KOMA-Script older than 3.0
\ifthenelse{\boolean{ADOC@BOOK}}{%
  \LoadClass[titlepage,11pt]{scrbook}
}{%
  \LoadClass[titlepage,11pt]{scrartcl}
}
\typeout{atlasdoc: paper size is \ADOC@paper}
\KOMAoptions{paper=\ADOC@paper}

% Required packages
\RequirePackage{graphicx}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{babel}

% Turn on bold math when using \bfseries
\def\bfseries{\fontseries\bfdefault\selectfont\boldmath}

% Page setup - independnet of ATLAS style.
\KOMAoptions{headinclude=true, footinclude=false}
% Put less text on the pages of BOOKs etc.
\ifthenelse{\boolean{ADOC@BOOK}}{%
  \KOMAoptions{DIV=12, BCOR=5mm, twoside}
}{%
  \KOMAoptions{DIV=14, BCOR=5mm}
}
\KOMAoptions{pagesize}

% Set KOMA-Script options for ATLAS style
\ifthenelse{\boolean{ADOC@atlasstyle}}{%
  % Do not put a dot after Section/Chapter, nor in the figure caption.
  \KOMAoptions{numbers=noendperiod}
  % Paragraph spacing is half a line
  \KOMAoptions{parskip=half}
  \addtokomafont{disposition}{\rmfamily}
  % Set font size for author. URLs in authors (such as orcid) will be black.
  \addtokomafont{author}{\ADOC@authorsize\hypersetup{urlcolor=black}}
  \addtokomafont{part}{\LARGE}
  \addtokomafont{descriptionlabel}{\rmfamily}
  %\setkomafont{pageheadfoot}{\normalsize\sffamily}
  \setkomafont{pagehead}{\normalsize\rmfamily}
  %\setkomafont{publishers}{\normalsize\rmfamily}
  % Set table of contents style to have no dotted lines for subsections
  \ifthenelse{\ADOC@texlive < 2016}{%
    \RequirePackage{tocstyle}
    \usetocstyle{noonewithdot}
  }{%
    \DeclareTOCStyleEntry[beforeskip=0pt plus .2pt,linefill=\hfill]{tocline}{subsection}
    \DeclareTOCStyleEntry[beforeskip=0pt plus .2pt,linefill=\hfill]{tocline}{subsubsection}
  }
  % Table of contents down to \ADOC@tocdepth which is 1 by default
  \ifthenelse{\ADOC@texlive < 2014}{%
    \setcounter{tocdepth}{2}
  }{%
    \setcounter{tocdepth}{\ADOC@tocdepth}
  }
  % Figure and table captions
  \ifthenelse{\boolean{ADOC@tableheading}}{\KOMAoption{captions}{tableheading}}{}
  \setkomafont{caption}{\normalfont\small}
  \setcapindent{0pt}
  \deffootnote[1em]{1em}{1em}{\textsuperscript{\thefootnotemark}\ }
}{}

% ATLAS draft cover pages for papers, PUB and CONF notes
\newcommand*{\ADOC@atlascover}{atlascover}
\ifthenelse{\boolean{ADOC@coverpage}}{%
  \typeout{atlasdoc: load atlascover package}
  \ifthenelse{\boolean{ADOC@CONFnote}}{%
    \PassOptionsToPackage{CONF,atlasdoc}{\ADOC@atlascover}
  }{%
    \ifthenelse{\boolean{ADOC@PUBnote}}{%
      \PassOptionsToPackage{PUB,atlasdoc}{\ADOC@atlascover}
    }{%
      \PassOptionsToPackage{atlasdoc}{\ADOC@atlascover}
    }
  }
  % Pass language editor option to cover pages
  \ifthenelse{\boolean{ADOC@LANGEDIT}}{%
    \PassOptionsToPackage{LANGEDIT}{\ADOC@atlascover}
  }{}
  \RequirePackage{\ADOC@atlascover}
}{}

% Remove the numbers from all the headings (\section, \subsection, etc.)
% \setcounter{secnumdepth}{-1}

% hyperref is needed in many places, so include it here
\RequirePackage{hyperref}

% Font(s)
\ifthenelse{\boolean{ADOC@txfonts}}{%
  % Needs special amsmath code in atlaspackage
  \typeout{atlasdoc: using txfonts}
  \RequirePackage[varg]{txfonts}
  \RequirePackage[T1]{fontenc}
  % Pass eVkern option to atlaspackage for siunitx
  \newcommand*{\ADOC@atlaspackage}{atlaspackage}
  \PassOptionsToPackage{eVkern}{\ADOC@atlaspackage}
}{%
  \ifthenelse{\boolean{ADOC@libertine}}{%
    \typeout{atlasdoc: using Libertine fonts}
    \RequirePackage{libertine}
    \RequirePackage[T1]{fontenc}
    % \RequirePackage[libertine, defaultsups]{newtxmath}
    \RequirePackage[libertine]{newtxmath}
  }{%
    \ifthenelse{\boolean{ADOC@palatino}}{%
      \typeout{atlasdoc: using Palatino fonts}
      % Palatino for rm and math | Helvetica for ss | Courier for tt
      \RequirePackage{mathpazo} % math & rm
      \linespread{1.05}        % Palatino needs more leading (space between lines)
      \RequirePackage[scaled]{helvet} % ss
      \RequirePackage{courier} % tt
      \normalfont
      \RequirePackage[T1]{fontenc}
    }{%
      \typeout{atlasdoc: using newtx fonts package}
      \RequirePackage{newtxtext}
      \RequirePackage{newtxmath}
    }
  }
}

% Adjust float settings to try to avoid problems.
% These follow the UK FAQ - see also P.199-200 of the LaTeX Book
\ifthenelse{\boolean{ADOC@floatopt}}{%
  \renewcommand{\topfraction}{0.85}
  \renewcommand{\bottomfraction}{0.70}
  \renewcommand{\textfraction}{0.15}
  \renewcommand{\floatpagefraction}{0.66}
  \renewcommand{\dbltopfraction}{0.66}
  \renewcommand{\dblfloatpagefraction}{0.66}
  \setcounter{topnumber}{9}
  \setcounter{bottomnumber}{9}
  \setcounter{totalnumber}{20}
}{}

% Make sure page sizes etc are calculated after font selection
\KOMAoptions{DIV=last}

% Add ability to include line numbers
\ifthenelse{\boolean{ADOC@mathlines}}{%
  \RequirePackage[mathlines]{lineno}
}{%
  \RequirePackage{lineno}
}
% If you have an old lineno or do not have it, you can get it from the latex/other directory
% \RequirePackage{latex/other/lineno}
% \nolinenumbers

% Show frame for checking dimensions etc.
\ifthenelse{\boolean{ADOC@showframe}}{%
  \RequirePackage{showframe}
}

% Try to avoid adding linenomath around unknown environments
% Code adapted from https://tex.stackexchange.com/questions/436011/linenomath-printing-extra-numbers-on-last-line-of-multline-align-flalign-envir
\ifthenelse{\boolean{ADOC@linenofix}}{%
  \RequirePackage{xpatch}
  \newcommand*\linenomathpatchAMS[1]{%
    \expandafter\xpretocmd\csname #1\endcsname {\linenomathAMS}{}{}%
    \expandafter\xpretocmd\csname #1*\endcsname{\linenomathAMS}{}{}%
    \expandafter\xapptocmd\csname end#1\endcsname {\endlinenomath}{}{}%
    \expandafter\xapptocmd\csname end#1*\endcsname{\endlinenomath}{}{}%
  }
  \expandafter\ifx\linenomath\linenomathWithnumbers
    \typeout{atlasdoc: add line numbers to equations}
    \let\linenomathAMS\linenomathWithnumbers
    \xpatchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{\typeout{atlasdoc xpatch: Extra linenumber patch worked}}{\typeout{*** atlasdoc xpatch: Extra linenumber patch failed}}
  \else
    \typeout{atlasdoc: do not add line numbers to equations}
    \let\linenomathAMS\linenomathNonumbers
  \fi
}{}

% Compute the time in hours and minutes; make new variables \timehh and \timemm
\newcount\timehh\newcount\timemm
\timehh=\time
\divide\timehh by 60 \timemm=\time
\count255=\timehh\multiply\count255 by -60 \advance\timemm by \count255
% Now make a string with date and time
\newcommand{\dateandtime}{\today \ --
  \ifnum\timehh<10 0\fi\number\timehh:\ifnum\timemm<10 0\fi\number\timemm}
% \RequirePackage{scrdate,scrtime}

% Draft heading/footer code
\newcommand{\ADOC@DraftHeading}{%
  \ifthenelse{\ADOC@texlive < 2015}{%
    \RequirePackage[headsepline]{scrpage2}
  }{%
    \RequirePackage[headsepline]{scrlayer-scrpage}
  }
  \ihead{}
  \chead[]{\fbox{\normalfont\ADOC@draftheading}}
  \ohead{}
  \ifoot{\dateandtime}
  \cfoot{}
  \ofoot{\thepage}
  \pagestyle{scrheadings}
}

% Include fancier header and footer for HepData material document
\ifthenelse{\boolean{ADOC@HEPDATA}}{%
  \ifthenelse{\ADOC@texlive < 2015}{%
    \RequirePackage[headsepline]{scrpage2}
  }{%
    \RequirePackage[headsepline]{scrlayer-scrpage}
  }
  \chead{ATLAS Collaboration --- arXiv:\AtlasArXivId\ \AtlasArXivCat}
  \pagestyle{scrheadings}
}{}

% Pass comment option to atlascomment.sty
\ifthenelse{\boolean{ADOC@LANGEDIT}}{%
  \newcommand*{\ADOC@atlascomment}{atlascomment}
  \ifthenelse{\boolean{ADOC@LANGSHOW}}{%
    \typeout{atlasdoc: turn on display of language editor comments}
    \PassOptionsToPackage{comment=true}{\ADOC@atlascomment}
  }{%
    \typeout{atlasdoc: turn off display of language editor comments}
    \PassOptionsToPackage{comment=false}{\ADOC@atlascomment}
  }
  \RequirePackage{\ADOC@atlascomment}
}{}

% Length needed for parbox/minipage in title page
% \setlength{\titlepageparbox}{\linewidth}
% \setlength{\fboxsep}{0pt}
% \addtolength{\titlepageparbox}{-2\fboxrule}
% \addtolength{\titlepageparbox}{-2\fboxsep}
% \addtolength{\titlepageparbox}{-9pt}
% \typeout{titlepageparbox is \the\titlepageparbox}

%-------------------------------------------------------------------------------
% Title page design
% \showboxdepth=\maxdimen
% \showboxbreadth=\maxdimen
\newlength{\titlepageparbox}%
\newcommand{\ATLAS@TitleHeader}{%
  \setlength{\titlepageparbox}{\textwidth}%
  % \addtolength{\titlepageparbox}{-11pt}%
  % \typeout{ATLAS title titlepageparbox is \the\titlepageparbox, text width \the\textwidth, line width \the\linewidth}%
  \parbox[t][35mm]{\titlepageparbox}{%
    \parbox[b][35mm][t]{0.23\linewidth}{%
      \ifthenelse{\boolean{ADOC@atlaslogo}}{%
        \includegraphics[height=25mm]{AT_atlaslogo_2015}\par
      }{%
        \rule{0pt}{25mm}\par
      }
      \sffamily\mdseries\fontsize{11}{13.2}\selectfont
      \ifthenelse{\equal{\ADOC@journal}{}}{\relax}{%
        \par\ADOC@subprepend\ \ADOC@journal\par
      }
    }%
    \hspace*{\fill}%
    \parbox[b][35mm][c]{0.47\linewidth}{%
      \centering
      {\sffamily\bfseries\fontsize{20}{24}\selectfont
        \ifthenelse{\equal{\ADOC@docheading}{}}{%
          \typeout{atlasdoc: using default heading}
          \textsf{\ADOC@docheadingdefault}\par
        }{%
          \typeout{atlasdoc: using special heading: \ADOC@docheading}
          \textsf{\ADOC@docheading}\par
        }
      }
      \vspace*{2ex}
      % Do not include reference code for final version of PUB note
      \ifthenelse{\boolean{ADOC@notenumber}}{%
        % ATLAS note number, if any
        \ifthenelse{\equal{\ADOC@atlasnote}{}}{%
          % ATLAS reference code, if any and no note number given
          \ifthenelse{\equal{\ADOC@refcode}{}}{%
            \mbox{}%
          }{%
            % Do not include reference code for final version of PUB note
            {\Large \ADOC@refcode}\par
          }
        }{%
          {\Large \ADOC@atlasnote}\par
        }
        \vspace*{1.5ex}
      }{%
        \typeout{atlasdoc: note number turned off}
        \par\vspace{1.4\baselineskip}
      }
      % Date, if any
      \ifthenelse{\boolean{ADOC@datetop}}{%
        \ifthenelse{\equal{\@date}{}}{%
          \mbox{}\par
        }{%
          \@date\par
        }
      }{}
    }%
    \hspace*{\fill}%
    \parbox[b][35mm][t]{0.23\linewidth}{%
      \hspace*{\fill}
      \ifthenelse{\boolean{ADOC@cernlogo}}{%
        \includegraphics[height=25mm]{AT_cernlogo}\par
      }{%
        \rule{0pt}{25mm}\par
      }
      \ifthenelse{\boolean{ADOC@atlasdraft}}{%
        \ifthenelse{\equal{\ADOC@draftversion}{}}{\relax}{%
          \normalsize\hspace*{\fill}Draft version \ADOC@draftversion
        }
      }{}
    }
  }
}

%-------------------------------------------------------------------------------
% CERN preprint title header
\newcommand{\ATLAS@CERNPreprintTitleHeader}{%
  \setlength{\titlepageparbox}{\textwidth}%
  % \addtolength{\titlepageparbox}{-11pt}%
  % \typeout{CERN preprint titlepageparbox is \the\titlepageparbox, text width \the\textwidth, line width \the\linewidth}%
  \parbox[t]{\titlepageparbox}{%
    \makebox[\linewidth]{\centering%
      \sffamily\mdseries\fontsize{14}{16.8}\selectfont%
      EUROPEAN ORGANISATION FOR NUCLEAR RESEARCH (CERN)
    }\par
    \vspace*{2mm}%
    \parbox[t]{0.45\linewidth}{%
      \ifthenelse{\boolean{ADOC@atlaslogo}}{%
        \includegraphics[height=25mm]{AT_atlaslogo_2015}\par
      }{%
        \rule{0pt}{25mm}\par
      }
      \sffamily\mdseries\fontsize{11}{13.2}\selectfont
      \ifthenelse{\equal{\ADOC@journalref}{}}{%
        \ifthenelse{\equal{\ADOC@journal}{}}{\relax}{%
          Submitted to: \ADOC@journal\par
        }
      }{%
          \ADOC@journalref\par
      }
      \ifthenelse{\equal{\ADOC@doi}{}}{\relax}{%
        DOI: \href{http://dx.doi.org/\ADOC@doi}{\ADOC@doi}\par
      }
    }%
    \hspace*{\fill}%
    \parbox[t]{0.45\linewidth}{%
      \hspace*{\fill}
      \ifthenelse{\boolean{ADOC@cernlogo}}{%
        \includegraphics[height=25mm]{AT_cernlogo}\par
      }{%
        \rule{0pt}{25mm}\par
      }
      \sffamily\mdseries\fontsize{11}{13.2}\selectfont
      \hspace*{\fill}\ADOC@preprintnumber\par
      \hspace*{\fill}\ADOC@atlasdate\par
    }%
    \par
    \vspace*{2mm}
    \rule{\linewidth}{1pt}\par
  }%
}

%-------------------------------------------------------------------------------
% Auxiliary material title header
\newcommand{\ATLAS@HepDataTitleHeader}{%
  \setlength{\titlepageparbox}{\textwidth}%
  % \typeout{HepData titlepageparbox is \the\titlepageparbox, text width \the\textwidth, line width \the\linewidth}%
  \parbox[t]{\titlepageparbox}{%
    \makebox[\linewidth]{\centering%
      \sffamily\mdseries\fontsize{14}{16.8}\selectfont%
      EUROPEAN ORGANISATION FOR NUCLEAR RESEARCH (CERN)
    }\par
    \vspace*{2mm}%
    \parbox[t]{0.45\linewidth}{%
      \includegraphics[height=25mm]{AT_atlaslogo_2015}\par
      \sffamily\mdseries\fontsize{11}{13.2}\selectfont
      arXiv: \AtlasArXivId\ \AtlasArXivCat
    }
    \hspace*{\fill}
    \parbox[t]{0.45\linewidth}{%
      \hspace*{\fill}\includegraphics[height=25mm]{AT_cernlogo}\par
      \sffamily\mdseries\fontsize{11}{13.2}\selectfont
      \hspace*{\fill}\ADOC@preprintnumber\par
      \hspace*{\fill}\ADOC@atlasdate\par
    }\par
    \vspace*{2mm}
    \rule{\linewidth}{1pt}\par
  }
}

%-------------------------------------------------------------------------------
% Book title header - only ATLAS logo
\newcommand{\ATLAS@BookTitleHeader}{%
  \setlength{\titlepageparbox}{\textwidth}%
  \parbox[t]{\titlepageparbox}{%
    \includegraphics[height=25mm]{AT_atlaslogo_2015}\par
    \hspace*{\fill}
  }
}

%-------------------------------------------------------------------------------
% Copyright cover footer - parbox does not introduce spurious vertical space
\newcommand{\ATLAS@CopyrightFooter}{%
  \setlength{\titlepageparbox}{\textwidth}
  \addtolength{\titlepageparbox}{-11pt}
  % \typeout{Copyright titlepageparbox is \the\titlepageparbox, text width \the\textwidth, line width \the\linewidth}
  % \parbox[b]{\titlepageparbox}{%
  {%
    \rmfamily\mdseries\fontsize{10}{12}\selectfont
    \ifthenelse{\boolean{ADOC@atlaslogo}}{%
      \copyright\ \the\year \ CERN for the benefit of the ATLAS Collaboration.\newline
      Reproduction of this article or parts of it is allowed as specified in the CC-BY-4.0 license.
    }{
      \copyright\ \the\year \ CERN\newline
      Reproduction of this article or parts of it is allowed as specified in the CC-BY-4.0 license.
    }
  }
}

% Information block for book option
\ifthenelse{\boolean{ADOC@BOOK}}{%
  \newcommand{\ATLAS@BookInfo}{%
    \begin{minipage}[b][0.4\textheight]{\textwidth}
      \large\rmfamily\flushleft
      \begin{tabbing}
        Set first column \= Set second column \kill
        \ifthenelse{\boolean{ADOC@atlasdraft}}{%
          \ifthenelse{\equal{\ADOC@draftversion}{}}{%
            Reference: \> \ADOC@preprintnumber\\
              \> \ADOC@refcode\\
            Created:   \> \ADOC@atlasdate \\
            Last modified: \> \today \\
          }{%
            Draft version: \> \ADOC@draftversion\\
            Created: \> \dateandtime\\
          }
        }{%
          Reference: \> \ADOC@preprintnumber\\
            \> \ADOC@refcode\\
          Created:   \> \ADOC@atlasdate \\
          Last modified: \> \today \\
        }
        \textbf{Prepared by:} \> \textbf{The ATLAS Collaboration}
      \end{tabbing}\par
    \end{minipage}
  }
}{}

% Command to create title page.
\newcommand{\AtlasTitlePage}{%
  % \typeout{In maketitle: line width1 is \the\linewidth, text width is \the\textwidth}
  \setlength{\parindent}{\z@}
  \setlength{\parskip}{\z@}
  % \setlength{\parfillskip}{\z@}
  % \typeout{In maketitle: line width2 is \the\linewidth, text width is \the\textwidth}
  % Cover pages
  \ifthenelse{\boolean{ADOC@coverpage}}{%
    % Make sure line numbers are off for cover pages
    \nolinenumbers
    \ACOV@PrintAtlasCover
    \clearpage
    \ACOV@PrintAtlasCoverPageTwo
    \clearpage
    % Turn line numbers on for a draft with a version number.
    \ifthenelse{\boolean{ADOC@atlasdraft}}{%
      \ifthenelse{\equal{\ADOC@draftversion}{}}{\relax}{\linenumbers}
    }{}
  }{}
  % Empty page and start numbering from here
  \thispagestyle{empty}
  \pagenumbering{arabic}
  % Header
  {\parfillskip=0pt\emergencystretch=0.5\textwidth
  \ifthenelse{\boolean{ADOC@cernpreprint}}{%
    \typeout{atlasdoc: using CERN preprint title page}
    \ATLAS@CERNPreprintTitleHeader\par
  }{%
    \ifthenelse{\boolean{ADOC@HEPDATA}}{%
      \typeout{atlasdoc: using HepData Material title page}
      \ATLAS@HepDataTitleHeader\par
    }{%
      \ifthenelse{\boolean{ADOC@BOOK}}{%
        \typeout{atlasdoc: using ATLAS book title page}
        \ATLAS@BookTitleHeader\par
      }{%
        \typeout{atlasdoc: using ATLAS document title page}
        \ATLAS@TitleHeader\par
      }
    }
  }
  }
  \vspace{4em plus2em minus2em}
  \ifthenelse{\boolean{ADOC@BOOK}}{%
    {\usekomafont{title}\ADOC@maintitlesize\flushleft\@title\par%
      \rule{\linewidth}{1.5pt}\par}
    % Extra information for TDR etc.
    \ATLAS@BookInfo\par
  }{%
    {\usekomafont{title}\ADOC@maintitlesize\centering\@title\par}
    \vspace{3em plus1em minus1em}
    {\usekomafont{author}\centering\@author\par}
  }
  \vspace{2em}
  % Abstract
  \ifthenelse{\boolean{ADOC@abstract} \AND \NOT \boolean{ADOC@BOOK}}{%
    \begin{quote}\ADOC@abstractsize
      \ifthenelse{\boolean{ADOC@atlasdraft}}{%
        \ifthenelse{\equal{\ADOC@draftversion}{}}{%
          \AtlasAbstractText\par
        }{%
          \begin{internallinenumbers}
            \AtlasAbstractText
          \end{internallinenumbers}\par
        }
      }{%
        \AtlasAbstractText\par
      }
    \end{quote}
  }{}
  \par\vspace*{\stretch{1}}%
  % Copyright
  \ATLAS@CopyrightFooter
  % Extra author information for special author lists.
  \@thanks\let\@thanks\@empty
  % Abstract for a book is on its own page
  \ifthenelse{\boolean{ADOC@abstract} \AND \boolean{ADOC@BOOK}}{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{quote}
      \ADOC@abstractsize\flushleft\textbf{Abstract}\newline
      \ifthenelse{\boolean{ADOC@atlasdraft}}{%
        \ifthenelse{\equal{\ADOC@draftversion}{}}{%
          \AtlasAbstractText\par
        }{%
          \begin{internallinenumbers}
          \AtlasAbstractText
          \end{internallinenumbers}\par
        }
      }{%
        \AtlasAbstractText\par
      }
    \end{quote}
    \vspace*{\fill}
    \cleardoublepage
  }{}
}

% Macro to replace \maketitle
\newcommand{\AtlasMaketitle}{%
  \begin{titlepage}
    \AtlasTitlePage
  \end{titlepage}
}

% Redefine \maketitle to use KOMA-Script titlepage environment
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \AtlasTitlePage
  \end{titlepage}
}

\AtBeginDocument{%
  % Turn on line numbers and back references for draft documents with a version number
  \ifthenelse{\boolean{ADOC@atlasdraft}}{%
    \ifthenelse{\equal{\ADOC@draftversion}{}}{%
      \typeout{*** atlasdoc: this ATLAS draft document does not have a version number}
    }{%
      \typeout{atlasdoc: this is an ATLAS draft document}
      \ADOC@DraftHeading
      \linenumbers
    }
  }{%
    \typeout{atlasdoc: this is the final version of an ATLAS document}
  }
  \ifthenelse{\boolean{ADOC@linenofix}}{%
    \typeout{+++ atlasdoc: using lineno package fix}
    \linenomathpatchAMS{align}
    \linenomathpatchAMS{alignat}
    \linenomathpatchAMS{equation}
    \linenomathpatchAMS{flalign}
    \linenomathpatchAMS{gather}
    \linenomathpatchAMS{multline}
  }{}
  % \typeout{atlasdoc sizes:}
  % \typeout{paper height and width \the\paperheight, \the\paperwidth}
  % \typeout{PDF page height and width \the\pdfpageheight, \the\pdfpagewidth}
  % \typeout{text height and width \the\textheight, \the\textwidth}
  % \typeout{line width \the\linewidth}
  % \typeout{margin width and sep \the\marginparwidth, \the\marginparsep}
}

\endinput
