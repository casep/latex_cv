FROM fedora:latest
RUN dnf install -y texlive texlive-latex texlive-preprint texlive-bold-extra texlive-collection-fontsrecommended ; dnf clean all
ARG UID=1000
ARG GID=1000
ARG LATEXFILE=CV
ARG OUTPUT_FOLDER=pdf
RUN useradd -U -u $UID appuser
USER appuser
#COPY --chown=appuser:appuser compile_pdf.sh /opt/
#ENTRYPOINT /opt/compile_pdf.sh $LATEXFILE $OUTPUT_FOLDER
WORKDIR /mnt
CMD mkdir $OUTPUT_FOLDER ; pdflatex -synctex=1 -interaction=nonstopmode -output-directory $OUTPUT_FOLDER $LATEXFILE