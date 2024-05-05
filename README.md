# Curriculum Vitae via LaTeX

Use a combination of LaTeX, VS Code, and GitHub Actions to maintain and publish a curriculum vitae (CV) with versioning.

## Setup

The following must be installed to work on the CV locally:

1. A TeX distribution, preferably [TeX Live](https://www.tug.org/texlive/). Your `PATH` must also point to your installed TeX distribution.
2. [VS Code](https://code.visualstudio.com/)

TODO.

### Settings for VS Code

The [.vscode](.vscode/) folder includes the recommended [extensions.json](.vscode/extensions.json) and [settings.json](.vscode/settings.json). Changes made here should be done sparingly, e.g., when required for dependency updates.

### Using `textindent` with LaTeX Workshop on MacOS

To enable LaTeX Workshop to correctly handle formatting on save, install the following Perl packages on your local machine via terminal:

```bash
sudo cpan Log::Log4perl
sudo cpan Log::Dispatch
sudo cpan YAML::Tiny
sudo cpan File::HomeDir
sudo cpan Unicode::GCString
```

This will require `sudo` access, likely via password. Then, follow the prompts, choosing the defaults as you go.

## Usage

The CV is updated in the [cv](cv/) directory, which includes:

- [bib](cv/bib), the folder containing `*.bib` files for formal references, like journal articles, conferences, and books
- [cv.cls](cv/cv.cls), the file defining the CV's style and structure of sections/components
- [cv.tex](cv/cv.tex), the file defining the CV content, using styles, variables, and environments exposed by `cv.cls`

## Development

Changes take place in the `drafting` branch. The `main` branch serves as the latest stable and released version of the CV, including its contents and the methods for generating it. When a CV draft is ready for release, make a pull request to merge the draft into `main`. If all checks pass, complete the merge to build and release a new version of the CV. Versions are formatted with `v{yyyy}.{mm}.{dd}.{i}`, e.g., [v2024.5.4.1](https://github.com/aridyckovsky/cv/releases/tag/v2024.5.4.1). Multiple versions within a day are tracked by an increasing sequence of natural numbers `i`.

## Acknowledgements

This automation is made possible with the help of great open source contributiosn like:

- [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop), a VS Code extension
- [LaTex Utilities](https://github.com/tecosaur/LaTeX-Utilities), a VS Code extension
- [Release Action](https://github.com/ncipollo/release-action), a GitHub Action
- [Next Release Tag](https://github.com/amitsingh-007/next-release-tag), a GitHub Action
