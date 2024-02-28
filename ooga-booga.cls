\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ooga-booga}[Ooga Booga Class v0.1]

% Base class and options
% =============================================================================

% Base class
\newcommand{\ob@baseclass}{book}

% Default paper size and margins
\newcommand{\ob@papersize}{a4paper}
\newlength{\ob@vmargin}
\setlength{\ob@vmargin}{105pt}
\newlength{\ob@textwidth}
\setlength{\ob@textwidth}{345pt}
\newlength{\ob@leftmargin}
\setlength{\ob@leftmargin}{105pt}

% Special heading formatting
\newcommand{\ob@headingstyle}{}

% Options for paper size
\DeclareOption{a4paper}{} % default
\DeclareOption{letterpaper}{
    \renewcommand{\ob@papersize}{letterpaper}
    \setlength{\ob@vmargin}{80pt}
    \setlength{\ob@leftmargin}{115pt}
}

% Option for sentence case in "List of Figures" and "List of Tables" headings
\DeclareOption{sentencecase}{\def\ob@headingcase{1}}

% Option for sans-serif headings
\DeclareOption{sansheadings}{\renewcommand{\ob@headingstyle}{\sffamily}}

% Suppress remaining book class options
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{oneside}{\OptionNotUsed}
\DeclareOption{openany}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax
\LoadClass{\baseclass}

% Packages
% =============================================================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{parskip}

% Frontmatter
% =============================================================================

\newenvironment{preface}[1][Preface]{%
    \thispagestyle{plain}%
    \chapter{#1}%
}{}

\ifdefined\ob@headingcase
    \renewcommand{\listfigurename}{List of figures}
    \renewcommand{\listtablename}{List of tables}
\fi

% Spacing and indentation
% =============================================================================

\setlength{\topsep}{\parskip}
\frenchspacing
\raggedbottom