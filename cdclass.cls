% document class of journal Collective Dynamics for LaTeX2e
% - 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cdclass}[2016/02/30 v2.0
^^JLaTeX document class for journal Collective Dynamics]
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ProcessOptions\relax
\LoadClass[12pt,twoside,BCOR=10mm]{scrartcl}
\RequirePackage{mathptmx}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{courier}
\RequirePackage[hang,font={footnotesize},nooneline,labelsep=quad,labelfont={bf,sf}]{caption}
\RequirePackage[hang]{subfigure}
\RequirePackage[hyphens]{url}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage[noadjust]{cite}
\RequirePackage{ifpdf}
\ifpdf
  \typeout{^^J *** PDF mode *** } 
  \RequirePackage[pdftex]{graphicx}
  \RequirePackage{epstopdf}
\else
  \typeout{^^J *** DVI mode ***} 
  \RequirePackage{graphicx}
\fi 
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{relsize}
\RequirePackage[pagewise]{lineno}
\RequirePackage{booktabs} % table \toprule etc
%
\newcommand{\hdoi}[1]{DOI: \href{http://dx.doi.org/#1}{\texttt{#1}}}% Header
\newcommand{\doi}[1]{\href{http://dx.doi.org/#1}{\texttt{doi:#1}}}
%
\graphicspath{{fig/}} % figures in directory fig
%
%\hypersetup{
%  colorlinks=false, 
%  filebordercolor = {1 0.5 0},
%  linkbordercolor = {1 0.5 0},
%  citebordercolor = {1 0.5 0},
%  urlbordercolor= {1 0.5 0}
%}
\hypersetup{
    colorlinks=true,
%    filecolor={green!50!black},
%    linkcolor={red!50!black},
%    citecolor={blue!50!black},
%    urlcolor={blue!80!black}
    filecolor=[rgb]{0.09, 0.52, 0.63},
    linkcolor=[rgb]{0.1, 0.1, 0.1},
    citecolor=[rgb]{0.1, 0.1, 0.1},
    urlcolor=[rgb]{0.09, 0.52, 0.63}
}
%
%
\newcommand{\sref}[1]{Sec.~\ref{#1}}
\newcommand{\fref}[1]{Fig.~\ref{#1}}
\newcommand{\frefi}[2]{Fig.~\ref{#1}(#2)}
\newcommand{\tref}[1]{Tab.~\ref{#1}}
\newcommand{\eref}[1]{Eq.~\ref{#1}}
\newcommand{\refi}[2]{\ref{#1}(#2)}
\newcommand{\aref}[1]{App.~\ref{#1}}
%
\newcommand{\titlerunning}[1]{\gdef\trun{#1}}
\newcommand{\authorrunning}[1]{\gdef\arun{#1}}
\newcommand{\authorlabel}[1]{$^{\textsf{\smaller #1}}$}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\renewcommand{\and}{\ifhmode\unskip\nobreak\fi\ $\cdot$\ }
\renewcommand{\date}[4]{\gdef\@year{#1}\gdef\@rdate{#2}\gdef\@vdate{#3}\gdef\@adate{#4}}
\newcommand{\online}[1]{\gdef\@online{#1}}
\newcommand{\identificacion}[1]{\gdef\@identificacion{#1}}
\newcommand{\volume}[1]{\gdef\@volume{#1}}
\newcommand{\firstpagenumber}[1]{\setcounter{page}{#1}\gdef\@firstpagenumber{#1}}
\newcommand{\keywords}[1]{\par\addvspace\medskipamount{\rightskip=0pt plus1cm
  \noindent\textsf{\bfseries Palabras claves:}\enspace\ignorespaces#1\par\addvspace\bigskipamount}}
%
\newcommand{\email}[1]{E-mail: \href{mailto:#1}{#1}}
\newlength{\emailtab}
\newcommand{\authoremail}[2]{\\\settowidth{\emailtab}{\mbox{\authorlabel{#1}}}
  \hspace*{\emailtab} \email{#2}}
%
\firstpagenumber{1} % number of first page inside volume / all starting with 1
\fancypagestyle{firstPage}{%
  \fancyhf{}% delete all header information 
  \fancyfoot[L]{\sffamily\bfseries
    \href{http://estudiosdetransporte.org/}{Estudios de Transporte} %\quad 
    % \href{http://collective-dynamics.eu/index.php/cod/issue/view/\@volume}{\@volume},
    % \href{http://collective-dynamics.eu/index.php/cod/article/view/\@online}{\@online}:\thepage--\pageref*{LastPage}
    % (\@year)
    }
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
} 
\fancypagestyle{cdPageStyle}{%
  \fancyhf{}%
  \rhead[\fancyplain{}{\sffamily\bfseries\arun}]{\fancyplain{}{\sffamily\bfseries\thepage}}
  \lhead[\fancyplain{}{\sffamily\bfseries\thepage}]{\fancyplain{}{\sffamily\bfseries\trun}}%
} 
\renewcommand{\maketitle}{
\bgroup
%    
  \thispagestyle{firstPage}
  \vspace*{1.4cm}
  \setlength{\parindent}{0pt}
  \sffamily
  {\Huge\bfseries\@title\par}\vspace*{.6cm}
  {\large\bfseries\@author\par}\vspace*{.2cm}
  \bgroup
    \footnotesize
    \def\and{\newline}
    \begin{addmargin}{1cm}
      \@institute\\[.2cm]%[.7cm]
    \end{addmargin}
    Recibido: \@rdate\quad /\quad Última revisión: \@vdate\quad /\quad Aceptado: \@adate\\%[.5cm]
    \ifx\trun\undefined\gdef\trun{\@title}\fi
    \ifx\arun\undefined\gdef\arun{\@author}\fi
  \egroup
\egroup
}
%
\pagestyle{cdPageStyle}
% Define abstract environment
\def\abstract{\par\addvspace{17pt}\rmfamily
  \trivlist\if!Abstracts!\item[]\else
  \item[\hskip\labelsep\textsf{\bfseries Resumen}]\fi%
}
\def\endabstract{\endtrivlist\addvspace{6pt}}
\newenvironment{abstracts}{\begin{abstract}}{\end{abstract}}
% Define acknowledgement environment
\def\acknowledgement{\par\addvspace{17pt}\small\rmfamily
  \trivlist\if!Acknowledgements!\item[]\else
  \item[\hskip\labelsep\textsf{\bfseries Acknowledgements}]\fi%
}
\def\endacknowledgement{\endtrivlist\addvspace{6pt}}
\newenvironment{acknowledgements}{\begin{acknowledgement}}{\end{acknowledgement}}
\endinput
% End of file cdclass.cls
