FROM rocker/tidyverse@sha256:4813816ad695004b738ccfff8513ce43f017e6fe78fb273aafd0bee4d4e1070a

# igraph (a Seurat dependency) needs libglpk40 at runtime; libglpk-dev
# covers source builds of packages that link against it.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libglpk40 \
        libglpk-dev \
        software-properties-common \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends git \
    && git --version \
    && apt-get purge -y software-properties-common \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# renv in the site library, from the same package snapshot as course lockfiles.
RUN Rscript -e 'install.packages("renv", repos = "https://p3m.dev/cran/2026-03-10")'
