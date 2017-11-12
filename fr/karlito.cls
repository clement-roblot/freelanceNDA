\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{karlito}



%definition des options
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\newboolean{load-remplissage}
\newboolean{load-impression}

\DeclareOption{remplissage}{\setboolean{load-remplissage}{true}}
\DeclareOption{impression}{\setboolean{load-impression}{true}}


\ProcessKeyvalOptions{karlito}\relax
\ProcessOptions\relax



\LoadClass[a4paper,12pt,onecolumn,twoside]{report}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			Mise en page				%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{fancyhdr}	%permet de faire des entêtes et pieds de page

\ifthenelse{\boolean{load-remplissage}}{	%mode remplissage

	\RequirePackage[parfill]{parskip}
	\RequirePackage[a4paper,left=3cm,right=3cm,top=4cm,bottom=4cm]{geometry}	%géometrie de la mise en page

}{			%mode normal

	\RequirePackage[a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}	%géometrie de la mise en page
}

\ifthenelse{\boolean{load-impression}}{	%mode impression

	%\setlength{\oddsidemargin}{5mm}
	%\setlength{\evensidemargin}{-\oddsidemargin}
	\AtEndDocument{
		\ifthenelse{\isodd{\thepage}}{}{\clearpage~\clearpage}	
	}
}{}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Pour les symboles des equations			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{gensymb}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{verbatim}
\RequirePackage[explicit]{titlesec}
\RequirePackage{varwidth}
\RequirePackage{lastpage}


\newlength{\margeBordCadre}
\setlength{\margeBordCadre}{1cm}

\usetikzlibrary{calc, backgrounds}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}




\fancypagestyle{plain}{%
  \pagestyle{fancy}

  \fancyhead{} % vide l’en-tête
  \fancyhead[RE, LO]{}

  \fancyfoot{} % vide le pied~de~page
  \fancyfoot[CE, CO]{\thepage/\pageref{LastPage}}
  \fancyfoot[LO,RE]{}
  \renewcommand{\headrulewidth}{1mm}
  \renewcommand{\footrulewidth}{1mm}
}


\pagestyle{plain}% doit être placé après les définitions précédentes



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Définition du style de chapitre			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}

%left, top, bottom, right
\titlespacing*{\chapter}{0cm}{1cm}{0cm}[0cm]
\titleformat{\chapter}[hang]{\bfseries}{\underline{ARTICLE \thechapter\,- #1} :}{0pt}{\bfseries}[]

%left, top, bottom, right
\titlespacing*{\section}{0cm}{0cm}{0cm}[0cm]
\titleformat{\section}[runin]{\bfseries}{\thesection\,- }{0pt}{\bfseries}[]


\RequirePackage{etoolbox}
\makeatletter
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother

