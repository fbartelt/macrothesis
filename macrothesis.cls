\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{macrothesis}[2025/18/06 v1.1.0 Macro Thesis Template]
\newcommand{\macrothesisversion}{v1.1.0 (2025/18/06)}

\RequirePackage{ifthen}
\RequirePackage{etoolbox}
% ---------------------------------------------------------------------------- %
%                              DEFAULT VALUES
% ---------------------------------------------------------------------------- %
\newcommand{\@mainlanguage}{english}
\newcommand{\@secondlanguage}{none}
\newcommand{\@universityName}{Universidade Federal de Minas Gerais}
\newcommand{\@programName}{Graduate Program in Electrical Engineering}
\newcommand{\@researchGroupName}{MACRO Research Group - Mechatronics, Control, and Robotics}
\newcommand{\@coursename}{Electrical Engineering}
\newcommand{\@locationName}{Belo Horizonte, Brazil}
\newcommand{\@notationpage}{}
\newcommand{\@dedicationContent}{}
\newcommand{\@epigraphContent}{}

\newcommand{\supportedlangs}{english, american, USenglish, canadian, british, 
australian, newzealand, UKenglish, brazil, portuguese, german, ngerman, spanish, 
french}
\newcommand{\titlelang}{Thesis}
\newcommand{\typelang}{Master}
\newcommand{\advisorlang}{Advisor}
\newcommand{\advisorlangplural}{Advisors}
\newcommand{\coadvisorlang}{Co-Advisor}
\newcommand{\submissiontext}{{\typelang} submitted to the {\@programName} of {\@universityName}, in partial fulfillment of the requirements for the degree of {\titlelang} in {\@coursename}}

\newif\if@hasfichacatalografica
\newcommand{\@fichapath}{} % Stores the path
\newif\if@hasatadefesa
\newcommand{\@atapath}{} % Stores the path
% ---------------------------------------------------------------------------- %
%                              IMPORT OPTIONS
% ---------------------------------------------------------------------------- %
\newif\if@useglossaries \@useglossariestrue
\DeclareOption{noglossaries}{%
  \@useglossariesfalse
}
\newif\if@usenatbib \@usenatbibtrue
\DeclareOption{nonatbib}{%
  \@usenatbibfalse
}
\newif\if@usehyperref \@usehyperreftrue
\DeclareOption{nohyperref}{%
  \@usehyperreffalse
}
\newif\if@usecleverref \@usecleverreftrue
\DeclareOption{nocleverref}{%
  \@usecleverreffalse
}
\newif\if@ufmgformat \@ufmgformatfalse
\DeclareOption{final}{%
  \@ufmgformattrue
}
% ---------------------------------------------------------------------------- %
%                              LANGUAGE OPTIONS
% ---------------------------------------------------------------------------- %
\DeclareOption{firstlang=english}{%
  \renewcommand{\@mainlanguage}{english}%
}
\DeclareOption{firstlang=american}{%
  \renewcommand{\@mainlanguage}{american}%
}
\DeclareOption{firstlang=USenglish}{%
  \renewcommand{\@mainlanguage}{USenglish}%
}
\DeclareOption{firstlang=canadian}{%
  \renewcommand{\@mainlanguage}{canadian}%
}
\DeclareOption{firstlang=british}{%
  \renewcommand{\@mainlanguage}{british}%
}
\DeclareOption{firstlang=australian}{%
  \renewcommand{\@mainlanguage}{australian}%
}
\DeclareOption{firstlang=newzealand}{%
  \renewcommand{\@mainlanguage}{newzealand}%
}
\DeclareOption{firstlang=UKenglish}{%
  \renewcommand{\@mainlanguage}{UKenglish}%
}
\DeclareOption{firstlang=brazil}{%
  \renewcommand{\@mainlanguage}{brazil}%
}
\DeclareOption{firstlang=portuguese}{%
  \renewcommand{\@mainlanguage}{portuguese}%
}
\DeclareOption{firstlang=german}{%
  \renewcommand{\@mainlanguage}{german}%
}
\DeclareOption{firstlang=ngerman}{%
  \renewcommand{\@mainlanguage}{ngerman}%
}
\DeclareOption{firstlang=spanish}{%
  \renewcommand{\@mainlanguage}{spanish}%
}
\DeclareOption{firstlang=french}{%
  \renewcommand{\@mainlanguage}{french}%
}

% Define options for secondlang
\newif\if@hasSecondLanguage
\DeclareOption{secondlang=english}{%
  \renewcommand{\@secondlanguage}{english}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=american}{%
  \renewcommand{\@secondlanguage}{american}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=USenglish}{%
  \renewcommand{\@secondlanguage}{USenglish}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=canadian}{%
  \renewcommand{\@secondlanguage}{canadian}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=british}{%
  \renewcommand{\@secondlanguage}{british}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=australian}{%
  \renewcommand{\@secondlanguage}{australian}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=newzealand}{%
  \renewcommand{\@secondlanguage}{newzealand}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=UKenglish}{%
  \renewcommand{\@secondlanguage}{UKenglish}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=brazil}{%
  \renewcommand{\@secondlanguage}{brazil}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=portuguese}{%
  \renewcommand{\@secondlanguage}{portuguese}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=german}{%
  \renewcommand{\@secondlanguage}{german}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=ngerman}{%
  \renewcommand{\@secondlanguage}{ngerman}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=spanish}{%
  \renewcommand{\@secondlanguage}{spanish}%
  \@hasSecondLanguagetrue
}
\DeclareOption{secondlang=french}{%
  \renewcommand{\@secondlanguage}{french}%
  \@hasSecondLanguagetrue
}
% ---------------------------------------------------------------------------- %
%                              TEXT OPTIONS
% ---------------------------------------------------------------------------- %
\newif\if@typeThesis \@typeThesistrue % True - thesis, False - dissertation
\DeclareOption{thesis}{%
  \@typeThesistrue
}
\DeclareOption{dissertation}{%
  \@typeThesisfalse
}
\newif\if@typeMaster \@typeMastertrue % True - master, False - doctor
\DeclareOption{master}{%
  \@typeMastertrue
}
\DeclareOption{doctor}{%
  \@typeMasterfalse
}
\newif\if@raffostyle
\DeclareOption{raffo}{%
  \@raffostyletrue
}
% ---------------------------------------------------------------------------- %
%                              CUSTOM OPTIONS
% ---------------------------------------------------------------------------- %
\newif\if@showlof \@showloftrue
\newif\if@showlot \@showlottrue

\DeclareOption{nolof}{\@showloffalse}
\DeclareOption{nolot}{\@showlotfalse}
% Process options
\ProcessOptions\relax

% ---------------------------------------------------------------------------- %
%                              REQUIRED PACKAGES
% ---------------------------------------------------------------------------- %
\LoadClass[12pt,a4paper,oneside,openany]{book}
% Load additional packages
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{pdfpages} % For PDF insertion -- Ficha Catalografica + Ata de defesa

% Load languages using babel
\if@hasSecondLanguage
  \RequirePackage[main=\@mainlanguage,\@secondlanguage]{babel}
\else
  \RequirePackage[main=\@mainlanguage]{babel}
  \renewcommand{\@secondlanguage}{\@mainlanguage} % avoids errors when switching
\fi
\RequirePackage{graphicx} % Required for including images
\RequirePackage[a4paper]{geometry} % Required for adjusting page dimensions and margins
\geometry{verbose,tmargin=3cm,bmargin=2cm,lmargin=3cm,rmargin=2cm,headheight=15pt}

\RequirePackage{setspace} % Required for changing line spacing
\RequirePackage{microtype} % Improves the spacing between words and letters
\onehalfspacing

% Other packages
\RequirePackage{fancyhdr} % Required for custom headers
\RequirePackage{xcolor} % Required for specifying colors by name
\RequirePackage{lmodern} % Latin Modern font
\RequirePackage[lmodern]{quotchap} % This is the main style of the macro package (makes the big numbers in chapters, etc.)

\if@ufmgformat
  \RequirePackage[nottoc,notlot,notlof]{tocbibind} % Dont add bibliography/index/contents to Table of Contents
\else
  \RequirePackage[nottoc]{tocbibind} % Add bibliography/index/contents to Table of Contents, not including ToC itself
\fi

\RequirePackage{import} % Used to import files from other directories
\RequirePackage{caption} % Required for customizing captions
\RequirePackage{subcaption} % Required for subfigures
\RequirePackage{amsmath,amssymb,amsthm,amsfonts,thmtools,mathrsfs} % Required for math
\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements
\RequirePackage{enumitem} % Required for customizing lists
% ---------------------------------------------------------------------------- %
%                              OPTIONAL PACKAGES
% ---------------------------------------------------------------------------- %
\if@usenatbib
    \RequirePackage[authoryear,round]{natbib}
\else
    \PackageInfo{macrothesis}{natbib package not loaded.}%
\fi
\if@usehyperref
    \RequirePackage[pdfusetitle,
    bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,
    breaklinks=true,backref=false,colorlinks=true,allcolors=teal]
    {hyperref}
\else
    \PackageInfo{macrothesis}{hyperref package not loaded.}%
\fi
\if@usecleverref
    \RequirePackage[capitalize,nameinlink]{cleveref}
\else
    \PackageInfo{macrothesis}{cleverref package not loaded.}%
\fi
\if@useglossaries
    \if@ufmgformat
      % Do not add glossaries to ToC in UFMG format
      \RequirePackage[acronym,nonumberlist,toc=false]{glossaries}%
    \else
      % Add glossaries to ToC in non-UFMG format
      \RequirePackage[acronym,nonumberlist,toc=true]{glossaries}%
    \fi
    % Create glossary for notation
    \newglossary[nlg]{notation}{not}{ntn}{\notationname}
    \newcommand{\newnotation}[3]{%
        \newglossaryentry{#1}{%
            type=notation,
            name={#2},
            description={#3},
            sort=def
        }
    }

    \makenoidxglossaries%
    
\else
    % Command to disable glossaries
    \PackageInfo{macrothesis}{glossaries package not loaded. Acronym and notation management will not be available.}%
\fi
% ---------------------------------------------------------------------------- %
%                              LOAD LAST
% ---------------------------------------------------------------------------- %
% UFMG requires PDF/A format for thesis submission
\if@ufmgformat
  \AtBeginDocument{\RequirePackage[a-1b]{pdfx}} % PDF/A-1b format
\fi
% This package is used to include list of figures and tables only if there are figures or tables
\RequirePackage[figure,table]{totalcount}
% ---------------------------------------------------------------------------- %
%                              CLASS FEATURES
% ---------------------------------------------------------------------------- %
% Custom theorem environments
\declaretheoremstyle[qed=\qedsymbol]{defnstyle}
\declaretheorem[name=Theorem,numberwithin=chapter]{theorem}
\declaretheorem[name=Proposition,numberwithin=chapter,sibling=theorem]{proposition}
\declaretheorem[name=Lemma,numberwithin=chapter,sibling=theorem]{lemma}
\declaretheorem[name=Corollary,numberwithin=chapter,sibling=theorem]{corollary}
\declaretheorem[name=Example,numberwithin=chapter,sibling=theorem,style=defnstyle]{example}
\declaretheorem[name=Remark,numberwithin=chapter,sibling=theorem,style=defnstyle]{remark}
\declaretheorem[name=Definition,numberwithin=chapter,sibling=theorem,style=defnstyle]{definition}
\declaretheorem[name=Assumption,numberwithin=chapter,sibling=theorem,style=defnstyle]{assumption}
\declaretheorem[name=Claim,numberwithin=chapter,sibling=theorem,style=defnstyle]{claim}
\declaretheorem[name=Conjecture,numberwithin=chapter,sibling=theorem,style=defnstyle]{conjecture}
\declaretheorem[name=Fact,numberwithin=chapter,sibling=theorem,style=defnstyle]{fact}
\declaretheorem[name=Problem,numberwithin=chapter,sibling=theorem,style=defnstyle]{problem}
\declaretheorem[name=Solution,numberwithin=chapter,sibling=theorem,style=defnstyle]{solution}
\declaretheorem[name=Criterion,numberwithin=chapter,sibling=theorem,style=defnstyle]{criterion}

% Custom lists
\newlist{property}{enumerate}{1}
\newlist{feature}{enumerate}{1}
\setlist[property]{label=\roman{propertyi}, ref=\thedefinition.\roman{propertyi},noitemsep}
\setlist[feature]{label=(\alph*), ref=(\alph*),noitemsep}

% Cleverref settings (if loaded)
\if@usecleverref
  \Crefname{theorem}{Theorem}{Theorems}
  \Crefname{proposition}{Proposition}{Propositions}
  \Crefname{lemma}{Lemma}{Lemmas}
  \Crefname{definition}{Definition}{Definitions}
  \Crefname{corollary}{Corollary}{Corollaries}
  \Crefname{listprop}{Property}{Properties}
  \Crefname{example}{Example}{Examples}
  \Crefname{remark}{Remark}{Remarks}
  \Crefname{assumption}{Assumption}{Assumptions}
  \Crefname{claim}{Claim}{Claims}
  \Crefname{conjecture}{Conjecture}{Conjectures}
  \Crefname{fact}{Fact}{Facts}
  \Crefname{problem}{Problem}{Problems}
  \Crefname{solution}{Solution}{Solutions}
  \Crefname{criterion}{Criterion}{Criteria}

  \Crefname{listprop}{Property}{Properties}
  \addtotheorempostheadhook[definition]{\crefalias{propertyi}{listprop}}
  \crefname{featurei}{Feature}{Features}
  \Crefname{figure}{Figure}{Figures}
\fi
% Change footnote numbering to symbols in minipage
\renewcommand{\thempfootnote}{\,\fnsymbol{mpfootnote}}
\fancypagestyle{thesisstyle}{%
    \fancyhf{} % Clear all headers/footers
    \fancyhead[R]{\thepage} % Page number always on right
    \fancyhead[L]{\small\itshape\rightmark} % Chapter title always on left
    \renewcommand{\headrulewidth}{0pt} % No header rule
    \renewcommand{\footrulewidth}{0pt} % No footer rule
  }
% ---------------------------------------------------------------------------- %
%                            UFMG FORMAT WORKAROUNDS
% ---------------------------------------------------------------------------- %
% All of these are for final version only (option 'final')
\newcommand{\removestyle}{
  % Workaround to avoid page numbers on the first pages of chapters (preamble)
  \fancypagestyle{plain}{%
    \fancyhf{} % No headers or footers
    \renewcommand{\headrulewidth}{0pt} % No header rule
    \renewcommand{\footrulewidth}{0pt} % No footer rule
  }
}

\newcommand{\setfancyheader}{
  % Part of the workaround -- sets page numbers to top right corner for chapters
  \fancypagestyle{plain}{%
    \fancyhf{} % Clear all headers/footers
    \fancyhead[R]{\thepage} % Page number always on right
    \fancyhead[L]{\small\itshape\rightmark} % Chapter title always on left
    \renewcommand{\headrulewidth}{0pt} % No header rule
    \renewcommand{\footrulewidth}{0pt} % No footer rule
  }
  \pagestyle{plain} % Set the page style to the modified plain
}

% Workaround to make chapter titles appear on the left
\if@ufmgformat
  \renewcommand{\@makechapterhead}[1]{%
    \chapterheadstartvskip%
    {\size@chapter
      \sectfont
      \raggedright % was \raggedleft
      {\chapnumfont
        \ifnum \c@secnumdepth >\m@ne%
          \if@mainmatter\thechapter\fi
        \fi
        \par\nobreak
      }%
      {\raggedright
        % ↓ removed "\advance\leftmargin10em" to avoid indentation
        \interlinepenalty\@M #1\par
      }%
    }%
    \nobreak\chapterheadendvskip\chapterheadendvskip
  }
\fi
% ---------------------------------------------------------------------------- %
%                              USER COMMANDS
% ---------------------------------------------------------------------------- %

% Command to store thesis title
\def\@thesisTitle{\@title}
% Command to store author name
\def\@thesisAuthor{\@author}
% Command to store advisor name
\newcommand{\advisorname}[1]{\def\@thesisAdvisor{#1}}
% Command to store co-advisor names (up to 2)
\newcommand{\coadvisorname}[2][]{%
  \ifx&#1& % Check if the optional argument is empty
    \def\@thesisCoadvisorB{} % If empty, set second coadvisor to empty
  \else
    \def\@thesisCoadvisorB{#1} % Set to the provided optional argument
  \fi

  \ifx&#2& % Check if the mandatory argument is empty
    \def\@thesisCoadvisorA{} % If empty, set first coadvisor to empty
  \else
    \def\@thesisCoadvisorA{#2} % Set to the provided mandatory argument
  \fi
}
% Command to store the program name
\newcommand{\programname}[1]{\renewcommand{\@programName}{#1}}
% Command to store university name
\newcommand{\universityname}[1]{\renewcommand{\@universityName}{#1}}
% Command to store location (city/state)
\newcommand{\locationname}[1]{\renewcommand{\@locationName}{#1}}
% Command to store research group name
\newcommand{\researchgroupname}[1]{\renewcommand{\@researchGroupName}{#1}}
% Command to store dedication text
\newif\if@hasdedication
\newcommand{\dedication}[1]{%
  \renewcommand{\@dedicationContent}{#1}
  \@hasdedicationtrue % Set the flag to true
}
% Command to store epigraph text
\newif\if@hasepigraph
\newcommand{\epigraph}[1]{%
  \renewcommand{\@epigraphContent}{#1}
  \@hasepigraphtrue % Set the flag to true
}
% Command to store acknowledgments text
\newcommand{\acknowledgments}[2][\acknowledgmentsname]{%
    \def\@acknowledgmentsTitle{#1} % Set title
    \def\@acknowledgmentsContent{#2} % Set content
}
% Command to store acknowledgments text in second language
\newif\if@acknowledgmentssecond
\newcommand{\acknowledgmentssecond}[2][\acknowledgmentsname]{%
    \@acknowledgmentssecondtrue % Set the flag to true
    \def\@acknowledgmentssecondTitle{#1} % Set title
    \def\@acknowledgmentssecondContent{#2} % Set content
}
% Command to set notation and acronyms page
\newcommand{\setnotationpage}[1]{\renewcommand{\@notationpage}{#1}}
\newcommand{\fichacatalografica}[1]{%
    \@hasfichacatalograficatrue % Set the flag to true
    \renewcommand{\@fichapath}{#1}% Store path
}
\newcommand{\atadefesa}[1]{%
    \@hasatadefesatrue % Set the flag to true
    \renewcommand{\@atapath}{#1}% Store path
}

% Command for abstract in first language
\newcommand{\abstract}[2][\abstractname]{%
    \def\@abstractTitle{#1} % Set title
    \def\@abstractContent{#2} % Set content
}

\newif\if@abstractsecond % Create a new conditional flag
% Command to store abstract in second language
\newcommand{\abstractsecond}[2][\abstractname]{%
  \@abstractsecondtrue % Set the flag to true
  \def\@secondAbstractTitle{#1} % Set title
  \def\@secondAbstractContent{#2} % Set content
}

\newcommand{\keywords}[2][\keywordname]{%
  \def\@keywordsTitle{#1} % Set title
  \def\@keywordsContent{#2} % Set content
}
\newcommand{\keywordssecond}[2][\keywordname]{%
  \def\@keywordssecondTitle{#1} % Set title
  \def\@keywordssecondContent{#2} % Set content
}

% Acronyms already handled by glossaries package
\newcommand{\notationname}{Notation}
\newcommand{\acknowledgmentsname}{Acknowledgments}
% Abstract names are already handled by babel
\newcommand{\keywordname}{Keywords}

% Cover Page Command
\newcommand{\maketitlepage}{%
    \if@ufmgformat
        % This forces the plain style (enforced by book class) to be empty
        \removestyle
        \pagestyle{empty}
        \pagenumbering{arabic}
        \setcounter{page}{0}

        \begin{center}
          \textbf{\MakeUppercase{\@universityName}}
          \par
          Escola de Engenharia
          \par
          Programa de P\'{o}s-Gradua\c{c}\~{a}o em Engenharia El\'{e}trica
          \par
          
          \par
        \end{center}
          
          \vspace*{3.2cm}
          
          \begin{center}
              \@thesisAuthor\\
          \end{center}
          
          \vspace*{3.2cm}
          \begin{center}
              \textbf{\MakeUppercase{\@thesisTitle}}
          \end{center}
          \vfill
          \begin{center}
            \@locationName\\
            \the\year
        \end{center}
    \else
        \thispagestyle{empty}
        \pagenumbering{roman}
        \setcounter{page}{1}
    
      % Research group Logo
      \includegraphics[scale=0.145]{template/logo}

      % University, Department, and Research Group
      {\small \@universityName\par}
      {\small \@programName\par}
      {\small \@researchGroupName\par}

      \vspace*{6.5cm}

      % Title
      \begin{center}
          {\Large\textbf{\expandafter\MakeUppercase\expandafter{\@thesisTitle}}}\vfill{}
      \end{center}

      % Author, Location, and Year
      \begin{center}
          \textbf{\@thesisAuthor}\\
          \@locationName\\
          \the\year
      \end{center}
    \fi
    \pagebreak
}

\newcommand{\preamblepage}{%
    \@makeinsidecoverpage
    % Include cataloging entry (Ficha Catalográfica) and defense certificate (Ata de Defesa)
    \@includedocuments
    \@makededicationpage
    \@makeacknowledgmentspage
    \@makeepigraphpage    
    \@makeabstractpage
    % Table of Contents, Figures and Tables
    \addtocontents{toc}{\protect{\pdfbookmark[0]{\contentsname}{toc}}}%
    \if@showlof
      \iftotalfigures
        \listoffigures
      \fi
    \fi
    \if@showlot
      \iftotaltables
        \listoftables
      \fi
    \fi
    \glossarypage
    \tableofcontents{}

    \section*{\protect\pagebreak}% For some reason this is necessary

    \if@ufmgformat
        % This sets the header again for plain style (enforces book class plain to follow the default style)
        \setfancyheader
    \else
        \pagestyle{thesisstyle}
        \pagenumbering{arabic}
        \setcounter{page}{1}
    \fi
}

\newcommand{\@makeinsidecoverpage}{%
  \selectlanguage{\@mainlanguage}
  \thispagestyle{empty}

  \begin{center}
  \textbf{\@thesisAuthor}
  \end{center}

  \vfill{}

  \begin{center}
  {\Large\textbf{\expandafter\MakeUppercase\expandafter{\@thesisTitle}}}
  \end{center}

  \vfill{}
  % Changes title name (Doctor / Master) with translations
  \if@typeMaster
    \renewcommand{\titlelang}{\masterlang}
  \else
    \renewcommand{\titlelang}{\doclang}
  \fi
  % Changes type of thesis (Thesis / Dissertation) with translations
  \if@typeThesis
    \renewcommand{\typelang}{\thesislang}
  \else
    \renewcommand{\typelang}{\dissertationlang}
  \fi

  \begin{flushright}
  \parbox[t]{0.6\columnwidth}{%
  {\submissiontext}

  \vspace{1cm}
  \if@raffostyle
    \textbf{{\advisorlangplural}:} \@thesisAdvisor %
  \else
    \textbf{{\advisorlang}:} \@thesisAdvisor %
  \fi
  \ifx\@thesisCoadvisorA\empty
      % No coadvisor
  \else
      \ifx\@thesisCoadvisorB\empty
        \if@raffostyle
          \\ \textcolor{white}{\textbf{{\advisorlangplural}:}} \@thesisCoadvisorA
        \else
          \\ \textbf{{\coadvisorlang}:} \@thesisCoadvisorA% Only first coadvisor
        \fi
      \else
        \if@raffostyle
          \\ \textcolor{white}{\textbf{{\advisorlangplural}:}} \@thesisCoadvisorA 
          \\ \textcolor{white}{\textbf{{\advisorlangplural}:}} \@thesisCoadvisorB
        \else
          \\ \textbf{{\coadvisorlang}:} \@thesisCoadvisorA 
          \\ \textbf{{\coadvisorlang}:} \@thesisCoadvisorB
        \fi
      \fi
  \fi
  }
  \end{flushright}

  \vspace*{\fill}

  \begin{center}
  \@locationName\\
  \the\year
  \end{center}
  \pagebreak
}

\newcommand{\@includedocuments}{%
  % Include Ficha Catalografica
  \if@hasfichacatalografica
  \PackageInfo{macrothesis}{Including Cataloging Entry (Ficha Catalográfica) PDF file: '\@fichapath'}%
  \IfFileExists{\@fichapath}{%
    \cleardoublepage%
    \thispagestyle{empty}%
    \includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{\@fichapath}%
    \cleardoublepage%
  }{%
    \PackageError{macrothesis}{%
    Missing Cataloging Entry (Ficha Catalográfica) PDF file at: '\@fichapath'%
    }{Check the file path and permissions}%
  }%
  \else
  \PackageWarning{macrothesis}{%
  Cataloging Entry (Ficha Catalográfica) was not provided. Ignore this warning if this is not the final version of the text.%
  }%
  \fi
  % Include Ata de Defesa (or Folha de Aprovacao)
  \if@hasatadefesa
  \PackageInfo{macrothesis}{Including Defense certificate (Ata de Defesa) PDF file: '\@atapath'}%
  \IfFileExists{\@atapath}{%
    \cleardoublepage%
    \thispagestyle{empty}%
    \includepdf[pages=-,pagecommand={\thispagestyle{empty}},width=\textwidth]{\@atapath}%
    \cleardoublepage%
  }{%
    \PackageError{macrothesis}{%
    Missing Defense certificate (Ata de Defesa) PDF file at: '\@atapath'%
    }{Check the file path and permissions}%
  }%
  \else
  \PackageWarning{macrothesis}{%
  Defense certificate (Ata de Defesa) not provided. This warning can be ignored in draft versions.%
  }%
  \fi
}

\newcommand{\@makededicationpage}{%
  % Dedication page
  \if@hasdedication
    \cleardoublepage
    \thispagestyle{empty}
    \null
    \vfill
    \hspace*{8cm}
    \begin{minipage}{0.45\textwidth}
      \selectlanguage{\@mainlanguage}%
      \begin{singlespace}
      \begin{flushleft}
        \hfill\emph{\@dedicationContent}
        \par\end{flushleft}
      \end{singlespace}
      \end{minipage}
  \else
    \PackageInfo{macrothesis}{No dedication content provided. This is optional.}%
  \fi
}

\newcommand{\@makeacknowledgmentspage}{%
  % Acknowledgments
  \cleardoublepage
  \selectlanguage{\@mainlanguage}%

  \chapter*{\@acknowledgmentsTitle}
  \@acknowledgmentsContent

  \if@acknowledgmentssecond
      \cleardoublepage
      \selectlanguage{\@secondlanguage}%
      \chapter*{\@acknowledgmentssecondTitle}
      \@acknowledgmentssecondContent
  \fi
}

\newcommand{\@makeepigraphpage}{%
  \if@hasepigraph
    \cleardoublepage
    \thispagestyle{empty}
    \null
    \vfill
    \hspace*{4cm}
    \begin{minipage}{0.7\textwidth}
      \selectlanguage{\@mainlanguage}%
      \begin{singlespace}
      \begin{flushleft}
        \hfill
        \emph{\@epigraphContent}
        \par\end{flushleft}
      \end{singlespace}
    \end{minipage}
  \else
    \PackageInfo{macrothesis}{No epigraph content provided. This is optional.}%
  \fi
}

\newcommand{\@makeabstractpage}{%
  % Second language Abstract
  \cleardoublepage
  % NORMA UFMG -- Primeiro Resumo (ptbr) depois Abstract (ou qualquer lingua estrangeira)
  \if@ufmgformat
    % Checks whether second language is portuguese or brazil
    \ifthenelse{%
        \equal{\@mainlanguage}{brazil}
        \OR
        \equal{\@mainlanguage}{portuguese}
    }{%
      % If first language is portuguese or brazil, print first abstract in portuguese
      \@printfirstlangabstract
      \cleardoublepage
      \@printsecondlangabstract
    }{%
      % If first language is not portuguese or brazil, print first abstract in second language
      \@printsecondlangabstract
      \cleardoublepage
      \@printfirstlangabstract
    }
  \else
    % If not UFMG format, print first abstract in first language
    \@printfirstlangabstract
    % Then print second abstract if it exists
    \cleardoublepage
    \@printsecondlangabstract
  \fi
  \selectlanguage{\@mainlanguage}%
  \pagebreak{}%
}

\newcommand{\@printfirstlangabstract}{%
  % First language Abstract
  \selectlanguage{\@mainlanguage}%
  \chapter*{\@abstractTitle}
  \@abstractContent
  \if@ufmgformat
    \\[\baselineskip]%
    \noindent\@keywordsTitle: \@keywordsContent.
  \else
    \newline\indent
    \emph{\@keywordsTitle:} \@keywordsContent.
  \fi
}

\newcommand{\@printsecondlangabstract}{%
  %checks wheter second abstract is empty, if not, prints it
  \if@abstractsecond
    \selectlanguage{\@secondlanguage}%
    \chapter*{\@secondAbstractTitle}
    \@secondAbstractContent
    \if@ufmgformat
      \\[\baselineskip]%
      \noindent\@keywordssecondTitle: \@keywordssecondContent.
    \else
      \newline\indent
      \emph{\@keywordssecondTitle:} \@keywordssecondContent.
    \fi
  \fi
}

\newcommand{\glossarypage}{
    % Conditionally load glossaries
    \selectlanguage{\@mainlanguage}%
    \if@useglossaries
        \PackageInfo{macrothesis}{Adding all acronyms and notations whether they are used or not.}% 
        \glsaddall
        \printnoidxglossary[type=acronym,sort=word]
        \printnoidxglossary[type=notation,style=long,sort=def]
    \else
        \@notationpage
    \fi
}

% ---------------------------------------------------------------------------- %
%                              LOCALE SETTINGS
% ---------------------------------------------------------------------------- %
% WARNING: Some of the translations may not be accurate. Please check them.
% Acknowledgments
\providecaptionname{brazil,portuguese}{\acknowledgmentsname}{Agradecimentos}
\providecaptionname{english,american,USenglish,canadian}{\acknowledgmentsname}{Acknowledgments}
\providecaptionname{british,australian,newzealand,UKenglish}{\acknowledgmentsname}{Acknowledgements}
\providecaptionname{spanish}{\acknowledgmentsname}{Agradecimientos}
\providecaptionname{french}{\acknowledgmentsname}{Remerciements}
\providecaptionname{german,ngerman}{\acknowledgmentsname}{Danksagungen}
% Notation
\providecaptionname{brazil,portuguese}{\notationname}{Notação}
\providecaptionname{english,american,USenglish,canadian,british,australian,
newzealand,UKenglish,french,german,ngerman}{\notationname}{Notation}
\providecaptionname{spanish}{\notationname}{Notación}
% Master
\providecaptionname{brazil,portuguese}{\masterlang}{Mestre}
\providecaptionname{english,american,USenglish,canadian,british,australian,
newzealand,UKenglish,german,ngerman}{\masterlang}{Master}
\providecaptionname{spanish}{\masterlang}{Maestro}
\providecaptionname{french}{\masterlang}{Maître}
\providecaptionname{}{\masterlang}{Master}
% Doctor
\providecaptionname{brazil,portuguese}{\doclang}{Doutor}
\providecaptionname{english,american,USenglish,canadian,british,australian,
newzealand,UKenglish,spanish}{\doclang}{Doctor}
\providecaptionname{french}{\doclang}{Docteur}
\providecaptionname{german,ngerman}{\doclang}{Doktor}
% Thesis
\providecaptionname{brazil,portuguese}{\thesislang}{Tese}
\providecaptionname{english,american,USenglish,canadian,british,australian,
newzealand,UKenglish,german,ngerman}{\thesislang}{Thesis}
\providecaptionname{spanish}{\thesislang}{Tesis}
\providecaptionname{french}{\thesislang}{Thèse}
% Dissertation
\providecaptionname{brazil,portuguese}{\dissertationlang}{Dissertação}
\providecaptionname{english,american,USenglish,canadian,british,australian,
newzealand,UKenglish,german,ngerman}{\dissertationlang}{Dissertation}
\providecaptionname{spanish}{\dissertationlang}{Disertación}
\providecaptionname{french}{\dissertationlang}{Mémoire}
% Advisor
\providecaptionname{brazil,portuguese}{\advisorlang}{Orientador}
\providecaptionname{english,american,USenglish,canadian}{\advisorlang}{Advisor}
\providecaptionname{british,australian,newzealand,UKenglish}{\advisorlang}{Supervisor}
\providecaptionname{spanish}{\advisorlang}{Director}
\providecaptionname{french}{\advisorlang}{Directeur}
\providecaptionname{german,ngerman}{\advisorlang}{Betreuer}
% Advisors (Plural)
\providecaptionname{brazil,portuguese}{\advisorlangplural}{Orientadores}
\providecaptionname{english,american,USenglish,canadian}{\advisorlangplural}{Advisors}
\providecaptionname{british,australian,newzealand,UKenglish}{\advisorlangplural}{Supervisors}
\providecaptionname{spanish}{\advisorlangplural}{Directores}
\providecaptionname{french}{\advisorlangplural}{Directeurs}
\providecaptionname{german,ngerman}{\advisorlangplural}{Betreuer}
% Co-advisor
\providecaptionname{brazil,portuguese}{\coadvisorlang}{Coorientador}
\providecaptionname{english,american,USenglish,canadian}{\coadvisorlang}{Co-advisor}
\providecaptionname{british,australian,newzealand,UKenglish}{\coadvisorlang}{Co-supervisor}
\providecaptionname{spanish}{\coadvisorlang}{Codirector}
\providecaptionname{french}{\coadvisorlang}{Codirecteur}
\providecaptionname{german,ngerman}{\coadvisorlang}{Kobetreuer}
%Submission text
\providecaptionname{american,USenglish,english,canadian,british,australian,
newzealand,UKenglish}{\submissiontext}{{\typelang} submitted to the {\@programName} of {\@universityName}, in partial fulfillment of the requirements for the degree of {\titlelang} in {\@coursename}.}
\providecaptionname{brazil,portuguese}{\submissiontext}{{\typelang} submetida ao {\@programName} da {\@universityName}, como parte dos requisitos para obtenção do título de {\titlelang} em {\@coursename}.}
\providecaptionname{spanish}{\submissiontext}{{\typelang} presentada al {\@programName} de la {\@universityName}, como parte de los requisitos para obtener el título de {\titlelang} en {\@coursename}.}
\providecaptionname{french}{\submissiontext}{{\typelang} présentée au {\@programName} de l'{\@universityName}, en vue de l'obtention du titre de {\titlelang} en {\@coursename}.}
\providecaptionname{german,ngerman}{\submissiontext}{{\typelang} vorgelegt dem {\@programName} der {\@universityName}, als Teil der Anforderungen für den Grad {\titlelang} im Fachgebiet {\@coursename}.}
% Keywords
\providecaptionname{brazil,portuguese}{\keywordname}{Palavras-chave}
\providecaptionname{american,USenglish,english,canadian,british,australian,
newzealand,UKenglish}{\keywordname}{Keywords}
\providecaptionname{spanish}{\keywordname}{Palabras clave}
\providecaptionname{french}{\keywordname}{Mots-clés}
\providecaptionname{german,ngerman}{\keywordname}{Schlüsselwörter}

