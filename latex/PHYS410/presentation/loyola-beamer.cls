% # A Loyola LaTeX Beamer Template

% This template is dedicated to the Loyola University Chicago Community. For issues or contributions visit https://github.com/mkahveci/loyola-beamer-template.

% For contributions, follow the regular GitHub workflow: 

% * clone
% * make a branch
% * edit locally
% * push, and 
% * do a pull request with details of commits

% ## Credits

% loyola-beamer.cls was inspired by https://github.com/zhtluo/purdue-slide-template and written based on Beamer Metropolis theme. 

% The University name and logos are owned by Loyola University Chicago https://www.luc.edu/umc/brandstandards/graphicidentity/downloads/

% Enjoy!

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{loyola-beamer}[A Loyola LaTeX Beamer Template]

% For 4:3 slides: 
\LoadClass{beamer}
% \LoadClass[aspectratio=169]{beamer}
\usetheme[progressbar=frametitle]{metropolis}
\RequirePackage[T1]{fontenc}
\setsansfont{Times}
% \setmonofont{Ubuntu Mono}
\RequirePackage[english]{babel}
\RequirePackage{calc}
\RequirePackage{environ}
\RequirePackage{svg}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\usepackage{amsmath}
\RequirePackage{siunitx} % Format scientific units
\RequirePackage{chemformula} % Format Chemical Formulae
\RequirePackage{tabularx}

% Color
\definecolor{loyola-gold}{RGB}{230, 176, 66}
\definecolor{loyola-dust}{RGB}{235, 217, 159}
\definecolor{loyola-field}{RGB}{221, 185, 69}
\definecolor{loyola-rush}{RGB}{218, 170, 0}
\definecolor{loyola-aged}{RGB}{142, 111, 62}
\definecolor{loyola-steam}{RGB}{196, 191, 192}
\definecolor{loyola-railway-gray}{RGB}{157, 151, 149}
\definecolor{loyola-cool-gray}{RGB}{111, 114, 123}
\definecolor{loyola-steel}{RGB}{85, 89, 96}
\definecolor{loyola-maroon}{RGB}{13, 137, 90}

% Disable navigation symbols 
\setbeamertemplate{navigation symbols}{}

% Draw background
\setbeamertemplate{background canvas}{
	\begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
		\begin{scope}[x={(current page.north east)},y={(current page.south west)}]
			\draw[loyola-gold,line width=.5pt] (0.1,0) -- (0.1,0.98);
			\draw[loyola-gold,line width=.5pt] (0.95,0.18) -- (0.98,0.18);
			\draw[loyola-gold,line width=.5pt] (0.98,0.18) -- (0.98,0.98);
		\end{scope}
	\end{tikzpicture}
}

% Customize Margin
\setbeamersize{text margin left=.12\paperwidth,text margin right=.11\paperwidth}

% Customize title
\setbeamercolor{frametitle}{fg=loyola-gold}
\newlength{\titlevspace}
\setlength{\titlevspace}{\dimexpr.13\paperheight - 20pt\relax}
\setbeamertemplate{frametitle}{\vspace*{\titlevspace}
	\insertframetitle}

% Customize footnote
\newcommand{\slidelogo}{}
\newcommand{\slidefoot}{}
\setbeamertemplate{footline}
{
	\hspace*{.12\paperwidth}
	\includesvg[width=.1\paperwidth,keepaspectratio]{\slidelogo}
	\makebox[.4\paperwidth][c]{\slidefoot}
	\makebox[.1\paperwidth][c]{\insertdate}
	\hspace{.01\paperwidth}
	\makebox[.1\paperwidth][c]{\insertframenumber/\inserttotalframenumber}
	\vspace*{.06\paperheight}
}

% Customize enumerate/itemize style
\setbeamerfont*{enumerate item}{series=\bfseries}
\setbeamerfont*{enumerate subitem}{series=\bfseries}
\setbeamerfont*{enumerate subsubitem}{series=\bfseries}
\setbeamercolor*{enumerate item}{fg=black}
\setbeamercolor*{enumerate subitem}{fg=black}
\setbeamercolor*{enumerate subsubitem}{fg=black}

\setbeamercolor*{itemize item}{fg=black}
\setbeamercolor*{itemize subitem}{fg=black}
\setbeamercolor*{itemize subsubitem}{fg=black}
\setbeamertemplate{itemize items}[square]

% Customize block style:
\setbeamercolor{block body}{bg=loyola-dust}
\setbeamercolor{block title}{bg=loyola-aged, fg=white}
\setbeamercolor{block body example}{bg=loyola-steam}
\setbeamercolor{block title example}{bg=loyola-steel, fg=white}
\setbeamercolor{block body alerted}{bg=alerted text.fg!10}
\setbeamercolor{block title alerted}{bg=alerted text.fg!20}

% Customize figure style:
\setbeamercolor{caption name}{fg=loyola-aged}

% Customize title page style
\setbeamercolor*{title}{fg=loyola-gold}
\setbeamerfont*{title}{size={\fontsize{26}{32}}, series=\fontseries{bc}, shape=\fontshape{it}}
\setbeamercolor*{subtitle}{fg=white}
\setbeamerfont*{subtitle}{size={\fontsize{10}{13}}, series=\fontseries{bm}, shape=\fontshape{it}}
\setbeamercolor*{author}{fg=white}
\setbeamerfont*{author}{size={\fontsize{10}{13}}, series=\fontseries{bm}, shape=\fontshape{n}}
\defbeamertemplate*{title page}{customized}[1][]
{
	\usebeamerfont{title}\usebeamercolor[fg]{title}
	\inserttitle\par
	\bigskip
	\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}
	\hfill\insertsubtitle\par
	\bigskip
	\usebeamerfont{author}\usebeamercolor[fg]{author}
	\insertauthor\par
	\insertinstitute\par
	\insertdate\par
}

\newcommand{\titlelogo}{}
\NewEnviron{titleframe}[1]{
	{
			\setbeamertemplate{background canvas}{
				\begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
					\begin{scope}[x={(current page.north east)},y={(current page.south west)}]
						\fill[loyola-maroon] (0,0) rectangle (1,1);
						\draw[loyola-gold,line width=.5pt] (0.1,0) -- (0.1,0.98);
					\end{scope}
				\end{tikzpicture}
			}
			\setbeamercolor{footline}{fg=white}
			\setbeamertemplate{footline}{
				\hspace*{.12\paperwidth}
				\includesvg[width=.2\paperwidth,keepaspectratio]{\titlelogo}
				\makebox[.4\paperwidth][c]{\slidefoot}
				\makebox[.1\paperwidth][c]{\insertdate}
				\hspace{.01\paperwidth}
				\makebox[.1\paperwidth][c]{\insertframenumber/\inserttotalframenumber}
				\vspace*{.06\paperheight}
			}
			\setbeamertemplate{frametitle}{\vspace*{.25\paperheight}
				\selectfont\insertframetitle}
			\setbeamercolor{normal text}{fg=white}
			\setbeamercolor{item}{fg=white}
			\begin{frame}{#1}
				\usebeamercolor[fg]{normal text}
				\BODY
			\end{frame}
		}
}

% Customize other page styles:
\NewEnviron{notitleframe}{
	{
			\setbeamertemplate{background canvas}{
				\begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
					\begin{scope}[x={(current page.north east)},y={(current page.south west)}]
						\draw[loyola-gold,line width=.5pt] (0.1,0) -- (0.1,0.98);
					\end{scope}
				\end{tikzpicture}
			}
			\begin{frame}
				\usebeamercolor[fg]{normal text}
				\BODY
			\end{frame}
		}
}
