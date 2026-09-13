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

### Verified

`ghcr.io/jasonsydes/bgmp-den-images/rstudio-course@sha256:cef02843e34bfbd71042741caf4706dcb4a483a48b65fed7c77fce3c172d1dc9`

Pulled and checked on Talapas, 2026-09-13: git 2.55.0, `libglpk.so.40`
present, renv loads, and igraph installs and loads without the missing-GLPK
failure seen on the unmodified base image.

Also launched through a den workspace on the same digest: `system("git
--version")` from inside the RStudio session (the rsession's own PATH, not a
container `exec`) reports git 2.55.0.
