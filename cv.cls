\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2026/04/29 Custom CV class]

\LoadClass[a4paper,11pt]{article}

\RequirePackage[top=0.2in, left=0.2in, right=0.2in, bottom=0.2in]{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage{academicons}
\RequirePackage{etoolbox}
\RequirePackage[T1]{fontenc}

% fonts
%\RequirePackage{lmodern}
%\RequirePackage{charter}
%\usepackage{sourcesanspro}
%\usepackage{roboto}
\usepackage[sfdefault]{FiraSans}
%\usepackage[scaled]{helvet}


% define colours
\definecolor{col}{HTML}{000000}
\definecolor{accentcol}{HTML}{5c5099}
\definecolor{dimcol}{HTML}{8c8c8c}

\AtBeginDocument{%
  \color{col}
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


\newcommand{\printbio}{
  \ifdefempty{\@cvbio}
    {}
    {%
      \@cvbio
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
    {\huge \bfseries \@cvname} \\[2pt]
    \@cvtitle \\[0pt]
    {\scriptsize \color{dimcol} \@cvaddress} 

    {\scriptsize    
    \cv@firsttrue
    \cvprint{\printemail}
    \cvprint{\printphoneno}
	\cvprint{\printlinkedin}
	\cvprint{\printgithub}
	\cvprint{\printwebpage}
	\cvprint{\printgooglescholar}
	\cvprint{\printorcid} 
	}
	\\[2pt]
	\printbio
  \end{center}
  \vspace{2pt}
}

% define cvitems
\newcommand{\cvitem}[3]{%
  \noindent
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
    \textbf{#1} & {\color{dimcol} \textit{#2}} \\
  \end{tabular*}
  \vspace{0pt}
  \\
  {\small #3}
  \vspace{2pt}
}

% for sections
\newcommand{\cvsection}[1]{%
  \vspace{2pt}
  \noindent
  {\Large\bfseries\color{col} #1}
  \par
  \vspace{4pt}
  \hrule
  \vspace{4pt}
}






