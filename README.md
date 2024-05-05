# Ari Dyckovsky's Curriculum Vitae via LaTeX

I use a combination of LaTeX, VS Code, and GitHub Actions to maintain and publish my curriculum vitae (CV) with versioning.

## Setup

The following must be installed to work on the CV locally:

1. A TeX distribution, preferably [TeX Live](https://www.tug.org/texlive/). Your `PATH` must also point to your installed TeX distribution.
2. [VS Code](https://code.visualstudio.com/)

TODO.

## Usage

TODO.

## Development

Changes take place in the `drafting` branch. The `main` branch serves as the latest stable and released version of the CV, including its contents and the methods for generating it. When a CV draft is ready for release, make a pull request to merge the draft into `main`. If all checks pass, complete the merge to build and release a new version of the CV. Versions are formatted with `v{yyyy}.{mm}.{dd}.{i}`, e.g., [v2024.5.4.1](https://github.com/aridyckovsky/cv/releases/tag/v2024.5.4.1). Multiple versions within a day are tracked by an increasing sequence of natural numbers `i`.

## Acknowledgements

This automation is made possible with the help of great open source contributiosn like:

- [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop), a VS Code extension
- [LaTex Utilities](https://github.com/tecosaur/LaTeX-Utilities), a VS Code extension
- [Release Action](https://github.com/ncipollo/release-action), a GitHub Action
- [Next Release Tag](https://github.com/amitsingh-007/next-release-tag), a GitHub Action
