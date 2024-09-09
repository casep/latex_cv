FROM fedora:latest
RUN dnf update -y && \
    dnf install -y texlive texlive-latex texlive-isodate texlive-lastpage texlive-preprint latexmk && \
    dnf clean all
ARG UID=1000
ARG GID=1000
ARG LATEXFILE=VMLetter
ARG OUTPUT_FOLDER=pdf
RUN useradd -l -U -u $UID appuser
USER appuser
WORKDIR /mnt
SHELL ["/bin/bash", "-c"]
ENTRYPOINT latexmk $LATEXFILE -pdf -interaction=nonstopmode -silent -quiet -jobname=$LATEXFILE -outdir=$OUTPUT_FOLDER -auxdir=/tmp/