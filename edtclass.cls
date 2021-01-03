% Clase para articulos en la revista Estudios de Transporte

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{edtclass}[2021/01/02 Clase para articulos en la revista Estudios de Transporte]
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
\RequirePackage{relsize}
\RequirePackage[pagewise]{lineno}
\RequirePackage{booktabs} % table \toprule etc
%
\newcommand{\hdoi}[1]{DOI: \href{http://dx.doi.org/#1}{{#1}}}% Header
\newcommand{\doi}[1]{\gdef\@ldoi{#1}}
%
\graphicspath{{fig/}} % figures in directory fig
\hypersetup{
  colorlinks=true,
  filecolor=[rgb]{0.09, 0.52, 0.63},
  linkcolor=[rgb]{0.1, 0.1, 0.1},
  citecolor=[rgb]{0.1, 0.1, 0.1},
  urlcolor=[rgb]{0.09, 0.52, 0.63}
}
%
%
\newcommand{\refseccion}[1]{Sección~\ref{#1}}
\newcommand{\reffigura}[1]{Figura~\ref{#1}}
\newcommand{\reftabla}[1]{Tabla~\ref{#1}}
\newcommand{\refecuacion}[1]{Ecuación~\ref{#1}}
%

\newcommand{\titlerunning}[1]{\gdef\trun{#1}}
\newcommand{\titulo}[1]{\gdef\@titulo{#1}\title{#1}}
\newcommand{\authorrunning}[1]{\gdef\arun{#1}}
\newcommand{\autorcorto}[1]{\gdef\@autorcorto{#1}}
\newcommand{\emailcorrespondencia}[1]{\gdef\@emailcorrespondencia{#1}}
\newcommand{\authorlabel}[1]{$^{\textsf{\smaller #1}}$}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\renewcommand{\and}{\ifhmode\unskip\nobreak\fi\ $\cdot$\ }
\newcommand{\fechas}[4]{\gdef\@year{#1}\gdef\@rdate{#2}\gdef\@vdate{#3}\gdef\@adate{#4}}

\newcommand{\firstpagenumber}[1]{\setcounter{page}{#1}\gdef\@firstpagenumber{#1}}

%Keywords
\newcommand{\itemprimerapagina}[2]{
    \par\addvspace\medskipamount{
      
      \noindent\textsf{
        \bfseries #1:
      }
      \enspace\ignorespaces{#2}\par\addvspace\bigskipamount}
  % }
}

% Identificacion de la revista junto al logo
\newcommand{\identificacionrevista}[4]{
  \begin{minipage}{0.6\textwidth}\raggedleft
    \textbf{REVISTA ESTUDIOS DE TRANSPORTE\\ Vol {#1}, N° {#2}, pag {#3} ({#4})}
  \end{minipage}
  \hfill%
  \noindent\begin{minipage}{0.2\textwidth}
    \includegraphics[width=\linewidth]{common/imagenes/logo.png}
  \end{minipage}%
}

\newcommand{\email}[1]{
  \href{mailto:#1}{#1}
}
\newlength{\emailtab}

%
%Configuacion de la primera pagina
\firstpagenumber{1} % number of first page inside volume / all starting with 1
\fancypagestyle{firstPage}{%
  \fancyhf{}% delete all header information 
  \fancyfoot[L]{
    \sffamily
    \footnotesize
      \textbf{
        Autor para correspondencia: \email{\@emailcorrespondencia}
        \\ \@autorcorto
      }
  }
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
  \rfoot{{\thepage}}
}

%
%\pagestyle{cdPageStyle}
% Configuracion todas las paginas
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[RO,RE]{\small\thepage}
\fancyfoot[LE]{\textbf{\small\@title}}
\fancyfoot[LO]{\textbf{\small\@autorcorto}}


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
    \@institute\\[.2cm]
  \end{addmargin}
  Recibido: \@rdate\quad /\quad Última revisión: \@vdate\quad /\quad Aceptado: \@adate\\%[.5cm]
  \hdoi{\@ldoi}
  \egroup
  \egroup
}


\newenvironment{abst}[1]{
  \par
  \addvspace{17pt}
  \rmfamily
}


% Definir el ambiente para agradecimientos
\def\agradecimientos{\par\addvspace{17pt}\small\rmfamily
\trivlist\if!Agradecimientos!\item[]\else
\item[\hskip\labelsep\textsf{\bfseries Agradecimientos}]\fi%
}
\def\endagradecimientos{\endtrivlist\addvspace{6pt}}
\newenvironment{Agradecimientos}{\begin{agradecimientos}}{\end{agradecimientos}}
\endinput
