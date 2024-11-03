\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ooga-booga}[Ooga Booga Class v0.1 by cooper\-johnston on GitHub]

% Base class and options
% =============================================================================

% Base class
\newcommand{\ob@baseclass}{book}

% Default paper size and margins
\newlength{\ob@paperwidth}
\setlength{\ob@paperwidth}{210mm}
\newlength{\ob@paperheight}
\setlength{\ob@paperheight}{297mm}
\newlength{\ob@vmargin}
\setlength{\ob@vmargin}{108pt}
\newlength{\ob@leftmargin}
\setlength{\ob@leftmargin}{108pt}
\newlength{\ob@textwidth}
\setlength{\ob@textwidth}{345pt}

% Special heading formatting
\newcommand{\ob@headingstyle}{}

% Options for paper size
\DeclareOption{a4paper}{} % default
\DeclareOption{letterpaper}{
    \setlength{\ob@paperwidth}{8.5in}
    \setlength{\ob@paperheight}{11in}
    \setlength{\ob@textwidth}{355pt}
}
\DeclareOption{b5paper}{
    \setlength{\ob@paperwidth}{176mm}
    \setlength{\ob@paperheight}{250mm}
    \setlength{\ob@vmargin}{77.88pt}
    \setlength{\ob@leftmargin}{77.88pt}
}
\DeclareOption{17x24paper}{
    \setlength{\ob@paperwidth}{17cm}
    \setlength{\ob@paperheight}{24cm}
    \setlength{\ob@vmargin}{69.35pt}
    \setlength{\ob@leftmargin}{69.35pt}
}

% Option for sentence case in "List of Figures" and "List of Tables" headings
\DeclareOption{sentencecase}{\def\ob@headingcase{1}}

% Option for sans-serif headings
\DeclareOption{sansheadings}{\renewcommand{\ob@headingstyle}{\sffamily}}

% Suppress remaining book class options
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{oneside}{\OptionNotUsed}
\DeclareOption{openany}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\ob@baseclass}}

\ProcessOptions\relax
\LoadClass{\ob@baseclass}

% Packages
% =============================================================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage[rigidchapters]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{parskip}

% Geometry
% =============================================================================

\geometry{
    paperwidth=\ob@paperwidth,
    paperheight=\ob@paperheight,
    vmargin=\ob@vmargin,
    left=\ob@leftmargin,
    textwidth=\ob@textwidth
}

% Headers and footers
% =============================================================================

% Chapter and section labels in header
\renewcommand{\sectionmark}[1]{\markright{\thesection\quad #1}}
\renewcommand{\chaptermark}[1]{\markboth{%
    \if@mainmatter\thechapter\quad\fi #1%
}{}}

\fancypagestyle{standard}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead[LO]{\rightmark}
    \fancyhead[RE]{\leftmark}
    \fancyhead[LE,RO]{\thepage}
}
\pagestyle{standard}

% Headings
% =============================================================================

% Length from top of page where body text starts at the start of a chapter
\newlength{\ob@textstart}
\setlength{\ob@textstart}{0.333\ob@paperheight}
\addtolength{\ob@textstart}{-\ob@vmargin} % not including top margin

\titleformat{\chapter}[display]
    {\normalfont\Large\bfseries\ob@headingstyle}
    {\chaptertitlename\ \thechapter}
    {0pt}
    {\raggedright\huge}

\titleformat{\section}
    {\normalfont\Large\bfseries\ob@headingstyle}{\thesection}{1em}{}

\titleformat{\subsection}
    {\normalfont\large\bfseries\ob@headingstyle}{\thesubsection}{1em}{}

\titleformat{\subsubsection}
    {\normalfont\normalsize\bfseries\ob@headingstyle}{\thesubsubsection}{1em}{}

\titleformat{\paragraph}[runin]
    {\normalfont\normalsize\bfseries\ob@headingstyle}{\theparagraph}{1em}{}

\titleformat{\subparagraph}[runin]
    {\normalfont\normalsize\bfseries\ob@headingstyle}{\thesubparagraph}{1em}{}

% Chapter headings at top of page, just under top margin
\titlespacing*{\chapter}{0pt}{-\f@size pt}{\ob@textstart}

% Title page
% =============================================================================

% Text to go at bottom of title page
\newcommand{\ob@titlepagenotes}{\@date} % defaults to the date
\newcommand{\titlepagenotes}[1]{\renewcommand{\ob@titlepagenotes}{#1}}

\renewcommand{\maketitle}{\begin{titlepage}%
    \raggedright%
    \noindent%
    \parbox[t][0pt]{\ob@textwidth}{%
        \vspace*{\ob@textstart}%
        \raggedright%
        \Huge\bfseries\ob@headingstyle\@title%
    }\par%
    \vspace*{-\parskip}\Large\@author\par%
    \vfill%
    \large\ob@titlepagenotes%
    \newpage%
    \thispagestyle{empty}%
    \null\vfill%
\end{titlepage}}

% Credit at bottom of reverse side of title page
% \newcommand{\ob@credit}{This document was typeset using the Ooga Booga {\LaTeX} Class\\ \url{https://github.com/cooper-johnston/ooga-booga/}}
% \fancypagestyle{titlepagereverse}{
%     \fancyhf{}
%     \renewcommand{\headrulewidth}{0pt}
%     \fancyfoot[R]{\color{lightgray}\ob@credit}
% }

% Frontmatter
% =============================================================================

\ifdefined\ob@headingcase
    \renewcommand{\listfigurename}{List of figures}
    \renewcommand{\listtablename}{List of tables}
\fi

% Spacing and indentation
% =============================================================================

\setlength{\topsep}{\parskip}
\frenchspacing
\raggedbottom

% Numbered lists
% =============================================================================

\setlist[enumerate]{
    labelindent=0pt,
    labelwidth=20pt,
    labelsep=4pt,
    leftmargin=!,
    align=left
}