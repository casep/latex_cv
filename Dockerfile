FROM fedora:latest
RUN dnf update -y
RUN dnf install -y texlive texlive-latex 
RUN dnf install -y texlive-isodate texlive-lastpage
RUN dnf install -y latexmk
RUN dnf clean all
ARG UID=1000
ARG GID=1000
ARG LATEXFILE=VMLetter
ARG OUTPUT_FOLDER=pdf
RUN useradd -U -u $UID appuser
USER appuser
WORKDIR /mnt
CMD mkdir -p $OUTPUT_FOLDER ; \
 latexmk $LATEXFILE -pdf -interaction=nonstopmode -silent -quiet -jobname=$LATEXFILE -outdir=$OUTPUT_FOLDER -auxdir=/tmp/
