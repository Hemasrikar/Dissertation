
%%% Class Information %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis}[2023/12/12 Thesis Class]

\RequirePackage{expl3} % Required for writing LaTeX3 code in this class.

%%% Handle Class Options %%%
\ExplSyntaxOn

\cs_new:Npn \Thesis_check_color:n #1 {
  \tl_set:Nn \l_tmpa_tl { #1 }
  \color_set:nn { \l_tmpa_tl } { #1 }
}

\keys_define:nn { Thesis } {
    school .choices:nn =
        { estg, esecs, esslei, esad, estm }
        { \tl_gset:Nn \g_Thesis_myschool_tl { #1 } },
    school / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}
        {Specified~'school'~not~available.~Defaulting~to~'estg'} },
    school .default:n = { estg },
    school .initial:n = { estg },

    coverstyle .choices:nn =
        { classic, bw }
        { \tl_gset:Nn \g_Thesis_mycover_tl { #1 } },
    coverstyle / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{Specified~'coverstyle'~not~available.~Defaulting~to~'classic'} },
    coverstyle .default:n = { classic },
    coverstyle .initial:n = { classic },

    chapterstyle .choices:nn = 
        { classic, fancy, modern } 
        { \tl_gset:Nn \g_Thesis_style_tl { #1 } },
    chapterstyle / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{Specified~'chapterstyle'~not~available.~Defaulting~to~'classic'} },
    chapterstyle .default:n = { classic },
    chapterstyle .initial:n = { classic },

    docstage .choices:nn = 
        { working, final } 
        { \tl_gset:Nn \g_Thesis_docstage_tl { #1 } },
    docstage / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{Specified~'docstage'~not~available.~Defaulting~to~'working'} },
    docstage .default:n = { working },
    docstage .initial:n = { working },

    media .choices:nn = 
        { paper, screen } 
        { \tl_gset:Nn \g_Thesis_media_tl { #1 } },
    media / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{Specified~'media'~not~available.~Defaulting~to~'paper'} },
    media .default:n = { paper },
    media .initial:n = { paper },

    linkcolor .default:n = { black },
    linkcolor .initial:n = { black },

    doctype .choices:nn = 
        { thesis, report } 
        { \tl_gset:Nn \g_Thesis_doctype_tl { #1 } },
    doctype / unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{Specified~'doctype'~not~available.~Defaulting~to~'thesis'} },
    doctype .default:n = { thesis },
    doctype .initial:n = { thesis },
    
    unknown .code:n = 
        { \ClassWarningNoLine{Thesis}{An~unknown~option~was~ignored.~Please~check~the~documentation~to~see~the~available~options} }
}

% \newcommand{\LanguageOption}{\g_Thesis_mylanguage_tl}
\newcommand{\SchoolOption}{\g_Thesis_myschool_tl}
\newcommand{\CoverOption}{\g_Thesis_mycover_tl}
\newcommand{\ChapterOption}{\g_Thesis_style_tl}
\newcommand{\DocStageOption}{\g_Thesis_docstage_tl}
\newcommand{\MediaOption}{\g_Thesis_media_tl}
\newcommand{\DocTypeOption}{g_Thesis_doctype_tl}

\ProcessKeyOptions[Thesis]
\ExplSyntaxOff

%%% Load Master Class %%%
\LoadClass[a4paper,twoside,11pt]{report}

%%% Required Packages %%%
\RequirePackage{ifthen} % Provides conditional statements.
\RequirePackage{etoolbox} % Advanced programming tools for LaTeX.
\RequirePackage{graphicx} % For including and manipulating images.
\RequirePackage{subcaption} % Subfigures and side-by-side captions.
\RequirePackage{tabularx} % Flexible-width tables.
\RequirePackage{xltabular} % Same as tabularx but to be used in long tables.
\RequirePackage{booktabs} % Professional table styling.
\RequirePackage{multirow} % Support for multirow cells in tables.
\RequirePackage{longtable} % Tables spanning multiple pages.
\RequirePackage{caption} % Customisation of captions.
\RequirePackage{enumitem} % Customisation of lists.
\RequirePackage{amsmath} % Advanced mathematical expressions.
\RequirePackage{amssymb} % Extended mathematical symbols.
\RequirePackage[dvipsnames]{xcolor} % Extended color support.
\RequirePackage{tcolorbox} % Creating colored and highlighted boxes.
\RequirePackage{varwidth} % Allows variable-width boxes.
\RequirePackage{titlesec} % Customisation of section and chapter titles.
\RequirePackage{titling} % Control over title and titlepage formatting.
\RequirePackage[toc,page]{appendix} % Formatting for appendices.
\RequirePackage[acronym]{glossaries} % Create glossaries and acronyms.
\RequirePackage[bookmarks,pdfusetitle]{hyperref} % Hyperlinks and PDF metadata.
\RequirePackage{xparse} % Advanced argument parsing for custom macros.
\RequirePackage{typearea} % Page layout adjustments (KOMA-Script).
\RequirePackage{eso-pic} % Adding elements to the page background.
\RequirePackage{setspace} % Adjust line spacing.
\RequirePackage[newfloat]{minted} % Syntax highlighting for code.
\RequirePackage{silence} % Suppress specific package warnings.
\RequirePackage{fontawesome5} % Font awesome icons.
\RequirePackage{calc} % Infix notation arithmetic.
\RequirePackage{contour} % Countour words in a given color.
\RequirePackage[normalem]{ulem} % A better underline.
\RequirePackage{mfirstuc} % Capitalise words in a sentence.
\RequirePackage{tikz} % Create high-quality graphics programmatically.
\RequirePackage{psvectorian} % To include in-text ornamatentions. 
\RequirePackage{blindtext} % Generate placeholder text.
\RequirePackage[english,calc,datesep={/}]{datetime2} % To get date and time
\RequirePackage{titletoc}
\RequirePackage{float}


\tcbuselibrary{most} % Load most libraries from the tcolorbox package.
\WarningsOff[blindtext] % Suppress warnings from the blindtext package.

%%% Import Configurations - Maintain the Specified Order! %%%
\usepackage{Configurations/00-Fonts}
\usepackage{Configurations/01-Colors}
\usepackage{Configurations/02-Margins}
\usepackage{Configurations/03-References}
\usepackage{Configurations/04-Headers}
\usepackage{Configurations/05-Contents}
\usepackage{Configurations/06-Glossary}
\usepackage{Configurations/07-Chapters}
\usepackage{Configurations/08-Tables}
\usepackage{Configurations/09-Code}
\usepackage{Configurations/10-Macros}
\usepackage{Configurations/11-Metadata}

%% ----------------------------------------------------------------------
%%    Setting up the fonts
%% ----------------------------------------------------------------------

\ifPDFTeX
    %% With pdfLaTeX, use Paletino as the main font and Roboto Slab as title fonts
    \RequirePackage[T1]{fontenc}  % Select T1 font encoding
    \RequirePackage{newpxtext}    % Palatino-like font...
    \RequirePackage{newpxmath}    % ...with support for mathematics

    \newcommand{\titlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{light}\selectfont}
    \newcommand{\largetitlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{thin}\selectfont}
\else
    
    \RequirePackage[no-math]{fontspec} % Advanced font selection

    %% Use Arial as the main font and Roboto Slab as title fonts
    \setmainfont{Arial}
    \setmathsf{Arial}
    \setmathtt{Arial}

    \newfontfamily\titlestyle{Roboto Slab Light}
    \newfontfamily\largetitlestyle{Roboto Slab Thin}
\fi


%% ----------------------------------------------------------------------
%%    Setting up the \makecover command for the cover page
%% ----------------------------------------------------------------------

\newcommand*{\makecover}{
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% Construct the cover page with Tikz
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};

        %% Add the affiliation on the left
        \node[rotate=90,below right=40mm and 3mm] at (current page.west) {%
            \ifdefvoid{\@affiliation}{}{\color{white}\titlestyle\@affiliation}};

        %% Add the logo in the bottom left
        % \node[above right=10mm] at (current page.south west) {%
        %     \includegraphics[scale=0.16]{Figures/logo-white}};

        %% Add the banner with the title, subtitle, subject and author(s)
        \node[below=2cm,fill=black!85,minimum width={\paperwidth},inner ysep=25pt,opacity=0.6,text opacity=1] at (current page.north) {%
            \begin{minipage}{0.9\paperwidth}
                %% Format and add the title
                \color{title}\raggedright\largetitlestyle\fontsize{33}{30}\selectfont%
                    \textbf{\@title} \\[0.5ex]
                %% Format and add (optional) subtitle and subject
                \color{white}\titlestyle\fontsize{18}{18}\selectfont%
                    \ifdefvoid{\@subtitle}{}{\textbf{\@subtitle} \\[2.5ex]}%
                    \ifdefvoid{\@subject}{}{\textbf{\@subject} \\[0.5ex]}

                %% Format and add author or table of authors
                \largetitlestyle\fontsize{20}{20}\selectfont%
                    \ifdefvoid{\@covertable}{\textbf{\@author}}{\@covertable}
            \end{minipage}};

    \end{tikzpicture}
    \newpage
}


%% ----------------------------------------------------------------------
%%    Setting up the \backcover command for the back page
%% ----------------------------------------------------------------------

\newcommand*{\backcover}{
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% Construct the cover page with Tikz
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};

        %% Add the affiliation on the left
        % \node[rotate=90,below right=40mm and 3mm] at (current page.west) {%
        %     \ifdefvoid{\@affiliation}{}{\color{white}\titlestyle\@affiliation}};

    \end{tikzpicture}
    \newpage
}


%% Establish commands for the subtitle, subject, affiliation, cover image and table of authors
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\newcommand*{\affiliation}[1]{\def\@affiliation{#1}}
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}
\newcommand*{\covertable}[1]{\def\@covertable{#1}}