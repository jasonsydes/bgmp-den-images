# bgmp-den-images

Container images for course RStudio sessions, built on top of the
digest-pinned `rocker/tidyverse:4.5.2`.

## rstudio-course

Adds to the base image:

- `libglpk40` and `libglpk-dev`, required by igraph (a Seurat dependency)
- git 2.48 or newer, from the git-core PPA
- renv, in the site library, from the same package snapshot as course lockfiles

Built by `.github/workflows/build.yml` (manual trigger), for `linux/amd64`,
and published to `ghcr.io`. Images are converted to Singularity/Apptainer
format on the cluster where they run; this repository does not do that
conversion.
