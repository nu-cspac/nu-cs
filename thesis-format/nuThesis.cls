% definition of the class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nuThesis}[Northwestern PhD Thesis Template]
%reference manager

\PassOptionsToClass{hyperref={bookmarks=true, hidelinks}, 12pt}{report}
\LoadClass[]{report}
% \doublespacing

% packages
\RequirePackage[doublespacing]{setspace}
\RequirePackage{etoolbox}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{doi}
\RequirePackage[letterpaper, margin=1in, top=0.75in, includefoot, includehead, heightrounded]{geometry}
\setlength{\headheight}{0.25in}
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault]{sourcesanspro}
\RequirePackage[default,regular,semibold,bold]{sourceserifpro}
\RequirePackage{graphicx}
\RequirePackage[vflt]{floatflt}
\RequirePackage{wrapfig}
\RequirePackage{xargs} % Used for new commands with optional arguments
\RequirePackage{soul}  % Used for custom comments
\RequirePackage{xspace}
\RequirePackage{listings}
\RequirePackage{soul}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[acronym,nonumberlist]{glossaries}  %glossary
\RequirePackage{appendix}  %for appendices
\RequirePackage{tocvsec2}
\RequirePackage{lipsum}
\RequirePackage{booktabs}
\RequirePackage{alltt}
\RequirePackage{tcolorbox}
\RequirePackage{subcaption}
\RequirePackage[shortcuts]{extdash}
\RequirePackage{upgreek}
\RequirePackage{stmaryrd}
\RequirePackage{multirow}
\RequirePackage[section]{placeins}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{lineno}
\RequirePackage{parskip}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{color}
\RequirePackage{pdflscape}
\RequirePackage{annotate-equations}
\RequirePackage[font=small]{caption}

% toggles and options
\newtoggle{nuThesis@nodoi}
    \togglefalse{nuThesis@nodoi}
\newtoggle{nuThesis@review}
    \togglefalse{nuThesis@review}

\DeclareOption{ieee}{
    \PassOptionsToPackage{style=ieee,backend=biber}{biblatex}
}
\DeclareOption{acmauthoryear}{
    \PassOptionsToPackage{style=acmauthoryear,backend=biber}{biblatex}
}
\DeclareOption{manualBib}{
    \PassOptionsToPackage{backend=biber}{biblatex}
}
\DeclareOption{nodoi}{
  \toggletrue{nuThesis@nodoi}
}
\DeclareOption{review}{
  \toggletrue{nuThesis@review}
}
\ProcessOptions
\RequirePackage{biblatex}

% page numbering
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{fancy}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-3.25ex \@plus -1ex \@minus -0.2ex}%
  {0.01pt}%
  {\bfseries}%
}

% Chapter/Section styles
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}

\titleformat{\chapter}[display]{\fontseries{sb}\Large\setstretch{1.15}}{\chaptertitlename~\thechapter}{-1mm}{\fontseries{sb}\LARGE\raggedright}{}

\titleformat{\section}[hang]{\fontseries{sb}\Large}{\thesection}{5mm}{\fontseries{sb}\Large\raggedright}{}

\titleformat{\subsection}[hang]{\fontseries{sb}\large}{\thesubsection}{5mm}{\fontseries{sb}\large\raggedright}{}

\titleformat{\subsubsection}[hang]{\fontseries{sb}\normalsize}{\thesubsubsection}{5mm}{\fontseries{sb}\normalsize\raggedright}{}

\titleformat{\paragraph}[hang]{\fontseries{sb}\normalsize}{}{0mm}{\fontseries{sb}\normalsize}{}

\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}
\renewcommand{\subsubsectionautorefname}{Section}

\setlength{\parskip}{5mm}
\setlength{\parindent}{30pt}

\renewcommand{\textbf}[1]{{\fontseries{sb}\selectfont #1}}

% title page
\renewcommand{\maketitle}{%
\begin{titlepage}
\topskip0in
\begin{center}
\begin{singlespacing}
\MakeUppercase{Northwestern University}\\
\vspace*{\fill}
\@title\\
\vspace*{\fill}
A DISSERTATION\\
\vspace*{\fill}
SUBMITTED TO THE GRADUATE SCHOOL\\
IN PARTIAL FULFILLMENT OF THE REQUIREMENTS\\
\vspace*{\fill}
for the degree\\
\vspace*{\fill}
DOCTOR OF PHILOSOPHY\\
\vspace*{\fill}
Field of \field{}\\
\vspace*{\fill}
By\\
\vspace{1\baselineskip}
\@author\\
\vspace*{\fill}
EVANSTON, ILLINOIS\\
\vspace*{\fill}
\conferredMonth{} \conferredYear{}
\end{singlespacing}
\end{center}
\end{titlepage}
\clearpage
\setcounter{page}{2}
}

% copyright
\renewcommand{\copyright}{
\begin{center}
\topskip0in
\vspace*{\fill}
© Copyright by \@author, \conferredYear \\
All Rights Reserved
\vspace*{\fill}
\end{center}
\clearpage
}

% abstract
\renewenvironment{abstract}{
\clearpage
\addcontentsline{toc}{chapter}{Abstract}
\currentpdfbookmark{Abstract}{abstract}  %add PDF bookmark for this page
\begin{centering}
Abstract\\
\end{centering}
}
{\endlist}

% Acknowledgment
\newenvironment{ack}{
\clearpage
\addcontentsline{toc}{chapter}{Acknowledgment}
\currentpdfbookmark{Acknowledgment}{ack}  %add PDF bookmark for this page
\begin{centering}
Acknowledgment\\
\end{centering}
}
{\endlist}

% Acknowledgment
\newenvironment{preface}{
\clearpage
\addcontentsline{toc}{chapter}{Preface}
\currentpdfbookmark{Preface}{preface}  %add PDF bookmark for this page
\begin{centering}
Preface\\
\end{centering}
}
{\endlist}

% Table of Contents
\setcounter{tocdepth}{1}
\renewcommand\contentsname{Table of Contents}
\newcommand{\insertToc}{
\clearpage
\addcontentsline{toc}{chapter}{Table of Contents}
\currentpdfbookmark{Table of Contents}{TOC}
\tableofcontents
}

% List of Figures
\newcommand{\insertLof}{
\clearpage
\addcontentsline{toc}{chapter}{List of Figures}
\begin{singlespace}
\currentpdfbookmark{List of Figures}{LOF}
\listoffigures
\end{singlespace}
}

% List of Figures
\newcommand{\insertLot}{
\clearpage
\addcontentsline{toc}{chapter}{List of Tables}
\begin{singlespace}
\currentpdfbookmark{List of Tables}{LOT}
\listoftables
\end{singlespace}
}

%% Bibliography
\addbibresource{reference.bib}
\iftoggle{nuThesis@nodoi}{%
  \AtEveryBibitem{\clearfield{doi}}
  \AtEveryBibitem{\clearlist{doi}}
}{}
\newcommand{\insertBib}[1]{
\clearpage
\addcontentsline{toc}{chapter}{References}
\begin{singlespace}
\setlength\bibitemsep{\baselineskip} 
\printbibliography[title={References}]
\end{singlespace}
}

% line numboers
\iftoggle{nuThesis@review}{%
\renewcommand{\linenumberfont}{\normalfont\tiny\color{red}}
\linenumbers
}{}

\newcommand{\useCustomTOCItem}[2]{
\addcontentsline{toc}{chapter}{#1}
\input{#2}
}
