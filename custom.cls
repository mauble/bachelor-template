\ProvidesClass{custom}

%========================
% Base class and geometry
%========================
\LoadClass[12pt]{article}
\RequirePackage[
    left=3.5cm,
    right=2.5cm,
    top=2.5cm,
    bottom=3cm,
    footskip=1.5cm]{geometry}

%========================
% Language and encoding
%========================
\RequirePackage{tocloft}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,ngerman]{babel}
\RequirePackage[babel]{csquotes}
\RequirePackage{microtype}
\RequirePackage{textcomp}
\AtBeginDocument{
  \shorthandoff{"}
}

%========================
% Fonts and line spacing
%========================
\RequirePackage{mathptmx}
\RequirePackage[T1]{fontenc}
\RequirePackage{parskip}
\renewcommand{\baselinestretch}{1.5}

%========================
% Graphics, tables, and colors
%========================
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
\graphicspath{{images/}}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage[
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=gray]{hyperref}

%========================
% Lorem ipsum
%========================
\RequirePackage{lipsum}

%========================
% Bibliography
%========================
\RequirePackage[backend=biber,citestyle=ieee]{biblatex}
\bibliography{literature}

%========================
% Glossary / Abbreviations
%========================
\RequirePackage[automake,nonumberlist,acronym,toc]{glossaries}
\makeglossaries
\renewcommand{\glsgroupskip}{}

%========================
% Section page breaks
%========================
\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\cleardoublepage}

%========================
% Front- / Main- / Backmatter environments
%========================
\newcommand{\romanNumbering}{
    \pagenumbering{Roman}
    \setcounter{page}{1}
}

\newcommand{\arabicNumbering}{
    \newcounter{frontmatterPage}
    \setcounter{frontmatterPage}{\value{page}}
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

\newcommand{\romanNumberingResume}{
    \pagenumbering{Roman}
    \setcounter{page}{\value{frontmatterPage}}
}

\newenvironment{frontmatter}{\romanNumbering}{\clearpage}
\newenvironment{mainmatter}{\arabicNumbering}{\clearpage\phantomsection}
\newenvironment{backmatter}{\romanNumberingResume}{}

%========================
% Table of contents, lists, etc.
%========================
\newcommand{\mytableofcontents}{
    \tableofcontents
    \sectionbreak
    \phantomsection
}

\newcommand{\mylistoffigures}{
    \addcontentsline{toc}{section}{Abbildungsverzeichnis}
    \listoffigures
    \sectionbreak
    \phantomsection
}

\newcommand{\mylistoftables}{
    \addcontentsline{toc}{section}{Tabellenverzeichnis}
    \listoftables
    \sectionbreak
    \phantomsection
}

\newcommand{\mylistofacronyms}{
    \printglossary[type=\acronymtype,title=Abkürzungsverzeichnis]
    \clearpage
    \phantomsection
}

\newcommand{\mycover}{
  \clearpage
  \thispagestyle{empty}
  \phantomsection
  \input{extra/Cover}
  \clearpage
}

\newcommand{\myconfidentiality}{
  \clearpage
  \thispagestyle{empty}
  \phantomsection
  \input{extra/Sperrvermerk}
  \clearpage
}

\newcommand{\mydeclaration}{
  \clearpage
  \thispagestyle{empty}
  \phantomsection
  \input{extra/Eigenständigkeitserklärung}
  \clearpage
}

\newcommand{\mybibliography}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{Literaturverzeichnis}
  \printbibliography[title=Literaturverzeichnis]
  \clearpage
}

%========================
% Appendix management
%========================

\newcommand{\appendixlistname}{Anhangsverzeichnis}
\providecommand*{\appendixitemautorefname}{Anhang}

\newlistof{appendixitem}{apx}{\appendixlistname}
\renewcommand{\theappendixitem}{\Alph{appendixitem}}
\renewcommand{\listofappendixitem}{%
  \section*{\appendixlistname}%
  \@starttoc{apx}%
}

\newcommand{\mylistofappendices}{
    \cleardoublepage
    \phantomsection
    \appendix
    \renewcommand{\thesection}{\Alph{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{section}{\appendixlistname}
    \listofappendixitem
    \clearpage
    \phantomsection
}

\newcommand{\addappendix}[1]{
    \phantomsection
    \refstepcounter{appendixitem}
    \addcontentsline{apx}{appendixitem}{\protect\numberline{\theappendixitem}#1}\par
    \section*{\theappendixitem\quad #1}
    \label{app:\theappendixitem}
}

\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

\makeatletter
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
\@addtoreset{equation}{section}
\makeatother

%========================
% Custom commands
%========================
\newcommand{\anyref}[1]{(siehe \autoref{#1})}

\newcommand{\sign}[2]{
\vspace{0.2cm}
\begin{center}
\renewcommand{\arraystretch}{0.7}
\begin{tabular}{p{7cm}p{7cm}}
\makebox[7cm][c]{\textit{#1}} & \\
\makebox[7cm][c]{\hrulefill} & \makebox[7cm][c]{\hrulefill} \\
\makebox[7cm][c]{\footnotesize Ort, Datum} & \makebox[7cm][c]{\footnotesize #2}
\end{tabular}
\end{center}
\vspace{0.2cm}
}

\newcommand{\fig}[3]{
\begin{figure}[htb]
    \centering
    \vspace{5mm}
    \includegraphics[width=#3cm,keepaspectratio]{#2}
    \vspace{5mm}
    \caption{#1}
    \label{fig:#2}
\end{figure}
}

\newcommand{\tab}[3]{
\begin{table}[htb]
    \centering
    \vspace{5mm}
    #3
    \vspace{5mm}
    \caption{#1}
    \label{tab:#2}
\end{table}
}
