 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ari Dyckovsky's CV Template - CV CLASS FILE
%
% This class file defines the structure and design of a hybrid CV/Resume template.
%
% Original header:
% Copyright (C) 2020 by Ari Dyckovsky
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Ari Dyckovsky
% Inspired by Trey Hunner's Medium Length Resume Template
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2020/04/29 v0.1 CV class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
\RequirePackage{needspace}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{xcolor}
\RequirePackage[normalem]{ulem}
\RequirePackage{contour}
\RequirePackage{fontawesome}

% Define my base RGB colors

\definecolor{mylinks}{RGB}{55, 79, 108}
\definecolor{myblack}{RGB}{48, 52, 63}
\definecolor{mygray}{RGB}{62, 78, 80}

% Define centered square bullet point

\newcommand{\squarebullet}{
    \color{myblack}\scalebox{0.5}{\raisebox{0.65ex}{$\blacksquare$}}
}
\renewcommand{\labelitemi}{\squarebullet}

% Define custom text underline command `myuline`

\renewcommand{\ULdepth}{0.30em}
\contourlength{0.08em}

\newcommand{\myuline}[1]{%
  \hspace*{-.5em}
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
  \hspace*{-.25em}%
}

% Define hyperlinked underline link for repository names
% Args: url, name

\newcommand{\repolink}[2]{
    \href{#1}{\myuline{\color{myblue}{\fontfamily{cmss}\selectfont{#2}}}}
}

% Define hyperlinked underline link for user handles
% Args: url, name

\newcommand{\usernamelink}[2]{
    \hspace*{-.75em}
    \href{#1}{\color{myblue}{@\myuline{#2}}}
}

% Define new command \leftrightoptions to justify text inputs on left and right

\newcommand{\leftrightoptions}[2]{%
  \begin{minipage}[t]{0.80\linewidth}
    \raggedright #1%
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.15\linewidth}
    \raggedleft #2%
  \end{minipage}
}

% Handle page style with no page numbers

\pagestyle{empty} % Suppress page numbers

%------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%------------------------------------------------------------------------------

\def \myname#1{\def\@myname{#1}} % Defines the \name command to set name
\def \@myname {} % Sets \@name to empty by default

\def \myaddress#1{\def\@myaddress{#1}} % Defines the \name command to set name
\def \@myaddress {} % Sets \@name to empty by default

\def \mylocation#1{\def\@mylocation{#1}} % Defines the \name command to set name
\def \@mylocation {} % Sets \@name to empty by default

\def \myphone#1{\def\@myphone{#1}} % Defines the \name command to set name
\def \@myphone {} % Sets \@name to empty by default

\def \myemail#1{\def\@myemail{#1}} % Defines the \name command to set name
\def \@myemail {} % Sets \@name to empty by default

\def \mywebsite#1{\def\@mywebsite{#1}} % Defines the \name command to set name
\def \@mywebsite {} % Sets \@name to empty by default

\def \mygithub#1{\def\@mygithub{#1}} % Defines the \name command to set name
\def \@mygithub {} % Sets \@name to empty by default

% \printname is used to print the name as a page header
\def \printheader {
    \begingroup
        \parfillskip=0pt
        \begin{center}
            \namesize \textsc{\@myname}
        \end{center}
        \medskip % must leave line empty below

        \noindent \emailsize \href{mailto:\@myemail}{\nolinkurl{\@myemail}} \hfill
            \addresssize \@myaddress
        \\
        \noindent \githubsize \href{\@mywebsite}{\@mywebsite} \hfill
            \locationsize \@mylocation % must leave line empty below\\


    \endgroup
}

%------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printheader % Print the name specified with \name
  \vspace{1.5em}
  %\hrule
}

%------------------------------------------------------------------------------
%	SECTIONS
%------------------------------------------------------------------------------

\def\headline#1{\hbox to \hsize{\hrulefill\quad\lower.3em\hbox{#1}\quad\hrulefill}}


% Defines the cvSection environment for the large sections within the CV
\newenvironment{cvSection}[1]{ % 1 input argument - section name
  %\needspace{10\baselineskip}
  %\sectionskip
  \headline{\textsc{\sectionheadersize \color{myblack} #1}}% Section title

  %\hrule % Horizontal line
  \vspace{1.25em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
  \vspace{1.25em}
}

% Defines the cvSection environment for the non-list sections within the CV
\newenvironment{cvSectionEmpty}[1]{ % 1 input argument - section name
  %\needspace{5\baselineskip}
  %\sectionskip
  \headline{\textsc{\sectionheadersize \color{myblack} #1}} % Section title

  \vspace{1.25em}

  %\hrule % Horizontal line
}{\vspace{1.25em}}

%------------------------------------------------------------------------------
%	RESEARCH EXPERIENCE SUBSECTIONS
%------------------------------------------------------------------------------

\newenvironment{cvSubsectionResearch}[5]{
    \leftrightoptions{{\bf #4}, {#2}}{{#3}}
    {\textit{#1}} {(\textit{Advisor: #5})}
    }{
        %\vspace{0.25em} % Some space after the list of bullet points
}

%------------------------------------------------------------------------------
%	TEACHING EXPERIENCE SUBSECTIONS
%------------------------------------------------------------------------------

\newenvironment{cvSubsectionTeaching}[4]{
    \leftrightoptions{{\bf #1} for {#2}}{{#3}}
    {\textit{#4}}
    }{
    %\vspace{0.5em} % Some space after the list of bullet points
}

%------------------------------------------------------------------------------
%	WORK EXPERIENCE SUBSECTIONS
%------------------------------------------------------------------------------

\newenvironment{cvSubsectionWork}[3]{ % 4 input arguments
    \leftrightoptions{{\bf #3}, {#1}}{{#2}} % Bold company name and date on the right

    }{
    %\vspace{0.5em} % Some space after the list of bullet points
}

%------------------------------------------------------------------------------
%	AWARD SUBSECTIONS
%------------------------------------------------------------------------------

\newenvironment{cvSubsectionAwards}[4]{ % 4 input arguments
    \leftrightoptions{{\bf #1}, {#2}}{{#3}}% Event on left and year on the right
    \\
    {\textit{#4}}
    }{
        %
}

%------------------------------------------------------------------------------
%	WHITESPACING
%------------------------------------------------------------------------------

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\addresssize{\normalsize}
\def\emailsize{\normalsize}
\def\phonesize{\normalsize}
\def\githubsize{\normalsize}
\def\locationsize{\normalsize}

\def\nameskip{\medskip}
\def\addressskip{\smallskip}
\def\emailskip{\smallskip}
\def\phoneskip{\smallskip}
\def\githubskip{\smallskip}
\def\locationskip{\smallskip}

\def\sectionheadersize{\Large}
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\sectionskip{\medskip} % The space after the heading section
