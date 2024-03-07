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
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{doi}
\RequirePackage[letterpaper, margin=1in, margintop=0.75in includefoot, includehead, heightrounded]{geometry}
\setlength{\headheight}{0.25in}
\RequirePackage[T1]{fontenc}
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

% Chapter style
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4} % allows subsubsection

\titlespacing{\chapter}{0pt}{-0.75in}{0.25in} % Comment out this if you want to have some space around the chapter title
% toggle between the below two lines for the chapter title styles
\titleformat{\chapter}[hang]{\normalfont\Huge\bfseries}{\thechapter}{5mm}{\LARGE}{} % in one line, e.g., 1 Introduction
%\titleformat{\chapter}[display]{\fontseries{sb}\Large}{Chapter \thechapter}{-9mm}{\fontseries{sb}\LARGE}{} % in two lines, e.g., Chapter 1 \\ Introduction

\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}
\renewcommand{\subsubsectionautorefname}{Section}

\setlength{\parskip}{5mm}
\setlength{\parindent}{15pt}


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
\currentpdfbookmark{Abstract}{abstract}  %add PDF bookmark for this page
\begin{centering}
Abstract\\
\end{centering}
\addcontentsline{toc}{chapter}{Abstract}
}
{\endlist}

% Acknowledgment
\newenvironment{ack}{
\clearpage
\currentpdfbookmark{Acknowledgment}{ack}  %add PDF bookmark for this page
\begin{centering}
Acknowledgment\\
\end{centering}
\addcontentsline{toc}{chapter}{Acknowledgment}
}
{\endlist}

% Acknowledgment
\newenvironment{preface}{
\clearpage
\currentpdfbookmark{Preface}{preface}  %add PDF bookmark for this page
\begin{centering}
Preface\\
\end{centering}
}
{\endlist}

% Table of Contents
\renewcommand\contentsname{Table of Contents}
\newcommand{\insertToc}{
\clearpage
\currentpdfbookmark{Table of Contents}{TOC}
\addcontentsline{toc}{chapter}{Table of Contents}
\tableofcontents
}

% List of Figures
\newcommand{\insertLof}{
\clearpage
\begin{singlespace}
\setlength\cftbeforefigskip{\baselineskip}
\currentpdfbookmark{List of Figures}{LOF}
\listoffigures
\addcontentsline{toc}{chapter}{List of Figures}
\end{singlespace}
}

% List of Figures
\newcommand{\insertLot}{
\clearpage
\begin{singlespace}
\setlength\cftbeforefigskip{\baselineskip}
\currentpdfbookmark{List of Tables}{LOT}
\listoftables
\addcontentsline{toc}{chapter}{List of Tables}
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
\begin{singlespace}
\setlength\bibitemsep{\baselineskip} 
\printbibliography[title={References}]
\end{singlespace}
\addcontentsline{toc}{chapter}{References}  
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
