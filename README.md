# MacroThesis - UFMG Thesis Template

A LaTeX class for Universidade Federal de Minas Gerais (UFMG) theses/dissertations, optimized for MACRO group standards.

## Key Features

- **UFMG Compliance**: `final` option meets library requirements
- **Smart Glossaries**: Auto-generated acronyms & notations
- **Multi-language**: English/Portuguese/German/Spanish/French support
- **Theorem Environments**: Predefined academic structures
- **Admin Tools**: Catalog sheet & defense certificate commands

## Getting Started

1. Download latest [release](https://github.com/fbartelt/macrothesis/releases)
2. Include these in your project:
   - `macrothesis.cls` (required)
   - `template/` directory (required)
   - Example files (recommended)

```latex
% Minimal setup
\usepackage{macrothesis}       % Basic usage
\title{A Minimal Thesis Example}
\author{John Doe}
\advisorname{Dr. Jane Smith}
\coadvisorname{Dr. Foo Bar}
\dedication{To my family.}
\acknowledgments{...}
\abstract{...}
\abstractsecond{...}
\fichacatalografica{template/fichacatalografica.pdf}
\atadefesa{template/defesa.pdf}

\begin{document}
\maketitlepage
\preamblepage
...
\end{document}
```

Detailed documentation: See `instructions.tex`

## UFMG Submission

Use `final` option when submitting to library:

```latex
\usepackage[final]{macrothesis}
```

Compliance features:

- Page numbering starts at cover (page 0)
- Numbering appears only from Introduction
- Replaces cover with official UFMG template
- Removes Roman numerals from preamble
- No blank pages
