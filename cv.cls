\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2026/04/29 Custom CV class]

\LoadClass[a4paper]{article}

\RequirePackage[top=0.2in, left=0.4in, right=0.4in, bottom=0.2in]{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage{academicons}
\RequirePackage{etoolbox}
\RequirePackage[T1]{fontenc}
\RequirePackage{ragged2e}
\RequirePackage{tabularx}

% fonts
%\RequirePackage{lmodern}
%\RequirePackage{charter}
%\usepackage{sourcesanspro}
%\usepackage{roboto}
\usepackage[sfdefault]{FiraSans}
%\usepackage[scaled]{helvet}


% define colours
\definecolor{col}{HTML}{000000}
\definecolor{accentcol}{HTML}{424242}
\definecolor{dimcol}{HTML}{8c8c8c}

% font sizes
\newcommand{\cvvsmallsz}{\fontsize{7.5}{7.5}\selectfont}
\newcommand{\cvsmallsz}{\fontsize{9}{9.5}\selectfont}
\newcommand{\cvbodysz}{\fontsize{10}{11}\selectfont}
\newcommand{\cvsectionsz}{\fontsize{12}{13}\selectfont\bfseries}
\newcommand{\cvnamesz}{\fontsize{20}{22}\selectfont\bfseries}

% hRule thickness
\def\hrulefill{\leavevmode\leaders\hrule height 2pt\hfill\kern\z@}

\AtBeginDocument{%
  \color{col}
  \cvbodysz
  
}



% define some links for headers
% non-optional
\newcommand{\cvname}[1]{\def\@cvname{#1}}
\newcommand{\cvemail}[1]{\def\@cvemail{#1}}
\newcommand{\cvtitle}[1]{\def\@cvtitle{#1}}
\newcommand{\cvaddress}[1]{\def\@cvaddress{#1}}

\newcommand{\@cvname}{Your Name}
\newcommand{\@cvemail}{email@email.com}
\newcommand{\@cvtitle}{Your Title}
\newcommand{\@cvaddress}{Your address}

% optional
\newcommand{\cvphoneno}[1]{\def\@cvphoneno{#1}}
\newcommand{\@cvphoneno}{}
\newcommand{\cvlinkedin}[1]{\def\@cvlinkedin{#1}}
\newcommand{\@cvlinkedin}{}
\newcommand{\cvgithub}[1]{\def\@cvgithub{#1}}
\newcommand{\@cvgithub}{}
\newcommand{\cvgooglescholar}[1]{\def\@cvgooglescholar{#1}}
\newcommand{\@cvgooglescholar}{} 
\newcommand{\cvorcid}[1]{\def\@cvorcid{#1}}
\newcommand{\@cvorcid}{} 
\newcommand{\cvwebppage}[1]{\def\@cvwebpage{#1}}
\newcommand{\@cvwebpage}{} 
\newcommand{\cvbio}[1]{\def\@cvbio{#1}}
\newcommand{\@cvbio}{} 


% commands for printing things
\newcommand{\printlinkedin}{
  \ifdefempty{\@cvlinkedin}
    {}
    {%
      \faLinkedin\ \href{https://linkedin.com/in/\@cvlinkedin}{\@cvlinkedin}
    }
}
\newcommand{\printgithub}{
  \ifdefempty{\@cvgithub}
    {}
    {%
      \faGithubSquare\ \href{https://github.com/\@cvgithub}{\@cvgithub}
    }
}
\newcommand{\printgooglescholar}{
  \ifdefempty{\@cvgooglescholar}
    {}
    {%
      \faGraduationCap\ 
      \href{\@cvgooglescholar}{\@cvname}
    }
}

\newcommand{\printorcid}{
  \ifdefempty{\@cvorcid}
    {}
    {%
      \href{https://orcid.org/\@cvorcid}{ORCID}
    }
}

\newcommand{\printwebpage}{
  \ifdefempty{\@cvwebpage}
    {}
    {%
      \faLaptop\ 
      \href{\@cvwebpage}{Web Page}
    }
}

\newcommand{\printphoneno}{
  \ifdefempty{\@cvwebpage}
    {}
    {%
      \faPhone*\ 
      \href{tel:\@cvphoneno}{:\@cvphoneno}
    }
}

\newcommand{\printemail}{
  \ifdefempty{\@cvemail}
    {}
    {%
      \faEnvelope:\ 
      \href{mailto:\@cvemail}{\@cvemail}
    }
}


\newcommand{\cvsep}{\hspace{1pt}\textbar\hspace{1pt}}
\newif\ifcv@first
\newcommand{\cvprint}[1]{%
  \ifdefempty{#1}
    {} % do nothing if empty
    {%
      \ifcv@first
        \global\cv@firstfalse
      \else
        \cvsep
      \fi
      #1
    }%
}



% create the header
\newcommand{\makecvheader}{
  \begin{center}
    {\cvnamesz \bfseries \@cvname\par}
    \vspace{2pt}

    {\@cvtitle\par}
    \vspace{1pt}

    {\cvsmallsz \color{dimcol} \@cvaddress\par}
    \vspace{4pt}

    {\cvvsmallsz   
      \cv@firsttrue
      \cvprint{\printemail}
      \cvprint{\printphoneno}
      \cvprint{\printlinkedin}
      \cvprint{\printgithub}
      \cvprint{\printwebpage}
      \cvprint{\printgooglescholar}
      \cvprint{\printorcid}
      \par
    }
    \vspace{2pt}

    {\cvsmallsz \@cvbio\par}
  \end{center}
}


% define cvitems
\newcommand{\cvitem}[4]{%
  \noindent
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
    \textbf{#1} & {\color{dimcol}\textit{#4}} \\
    #2 & {\footnotesize \faMapMarker*\ #3}
  \end{tabular*}
}

\newcommand{\cvitemskip}{\vspace{1.2em}}

% for sections
\newcommand{\cvsection}[1]{%
  \vspace{1em}
  \noindent
  {\cvsectionsz\bfseries\color{col} #1 \hrulefill}
  \par
  \vspace{4pt}
}


\setlist[itemize]{
  label=\faAngleRight,
  leftmargin=1.5em,
  itemsep=1pt,
  font=\cvsmallsz,
  before=\cvsmallsz,
  topsep=0pt,
  parsep=2pt,
  partopsep=2pt
}





