[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/k2tzumi/slidev-boilerplate)

# Welcome to [Slidev](https://github.com/slidevjs/slidev)!

To start the slide show:

- `npm install`
- `npm run dev`
- visit http://localhost:3030

Edit the [slides.md](./slides.md) to see the changes.

Learn more about Slidev on [documentations](https://sli.dev/).

## How to publish to GitHub Pages

This repository extends Slidev's Init Project with the following features:

* Installation of several Slidev Addons  
* Lint and build-time validation  
* Version management using [tagpr](https://github.com/Songmu/tagpr)  
* Release management synchronized with version (PDF generation)  
* Publishing to GitHub Pages (OGP, Google tag support)  

Publishing to GitHub Pages is done via Github Actions, but some repository settings are required in advance.   

Please follow the steps below.

1. Enable GitHub Pages    
Select GitHub Actions as the source  
After selection, `github-pages` will be added to Environments.
1. Set `Deployment branches and tags` for `github-pages` in Environments  
Add `tagpr-from-*` to the branch from `Add deployment branch or tag rule`.
1. Change the permissions of GitHub Actions to enable tagpr execution  
Change `Workflow permissions` to `Read and write permissions`, check `Allow GitHub Actions to create and approve pull requests`, and save.
1. Set the Google tag ID in the Repository secrets of GitHub Actions (optional)  
Register a secret named `GA_TRACKING_ID` in `Repository secrets`.  

Publishing to GitHub Pages is linked to the release branch of tagpr when it is merged.  
