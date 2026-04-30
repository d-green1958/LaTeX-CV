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
\RequirePackage{graphicx}
\RequirePackage{tikz}

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
\newcommand{\cvlargesz}{\fontsize{12}{13}\selectfont}
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
      \mbox{\faLinkedin~\href{https://linkedin.com/in/\@cvlinkedin}{\@cvlinkedin}}
    }
}
\newcommand{\printgithub}{
  \ifdefempty{\@cvgithub}
    {}
    {%
      \mbox{\faGithubSquare~\href{https://github.com/\@cvgithub}{\@cvgithub}}
    }
}
\newcommand{\printgooglescholar}{
  \ifdefempty{\@cvgooglescholar}
    {}
    {%
      \mbox{\faGraduationCap~\href{\@cvgooglescholar}{\@cvname}}
    }
}

\newcommand{\printorcid}{
  \ifdefempty{\@cvorcid}
    {}
    {%
      \mbox{\href{https://orcid.org/\@cvorcid}{ORCID}}
    }
}

\newcommand{\printwebpage}{
  \ifdefempty{\@cvwebpage}
    {}
    {%
      \mbox{\faLaptop~\href{\@cvwebpage}{Web Page}}
    }
}

\newcommand{\printphoneno}{
  \ifdefempty{\@cvphoneno}
    {}
    {%
      \mbox{\faPhone*~\href{tel:\@cvphoneno}{\@cvphoneno}}
    }
}

\newcommand{\printemail}{
  \ifdefempty{\@cvemail}
    {}
    {%
      \mbox{\faEnvelope~\href{mailto:\@cvemail}{\@cvemail}}
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


% define cvitems
\newcommand{\cvitem}[4]{%
  \noindent
  \begin{tabularx}{\textwidth}{@{}p{0.72\textwidth}>{\raggedleft\arraybackslash}p{0.25\textwidth}@{}}
    \makebox[0pt][l]{\textbf{#1}} & \makebox[0pt][r]{\color{dimcol}\textit{#4}} \\[-2pt]
    {\cvsmallsz #2} & {\cvsmallsz \faMapMarker*\ #3}
  \end{tabularx}
  % \vspace{4pt}
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


% create the 2-column header
\newcommand{\makecvtwocolheader}{
  \noindent
  \begin{minipage}[t]{0.7\textwidth}
    \vspace{0pt}
    \begin{minipage}[t]{0.35\textwidth}
      \vspace{0pt}
      {\cvnamesz \bfseries \@cvname\par}
      \vspace{2pt}
      {\@cvtitle\par}
      \vspace{1pt}   
      {\cvsmallsz \color{dimcol} \@cvaddress\par}
      \vspace{4pt}
    \end{minipage}
    \hfill % fill in the other 0.3
    \begin{minipage}[t]{0.35\textwidth}
      \vspace{0pt}
      \begin{center}
        {\cvvsmallsz   
          \printemail
          \printphoneno
          \printlinkedin
          \printgithub
          \printwebpage
          \printgooglescholar
          \printorcid
        }
        \vspace{2pt}
      \end{center}
    \end{minipage}

    {\cvsmallsz \@cvbio\par}
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.3\textwidth}
    \vspace{0pt}
    \centering
    \begin{tikzpicture}
    \clip (0,0) circle (1.75cm);
    \node at (0,0) {\includegraphics[width=3.5cm]{figs/profile.jpeg}};
  \end{tikzpicture}
  \end{minipage}
  \hrulefill
}

