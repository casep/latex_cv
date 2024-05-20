# Compile

`docker build . -t casep/latex_cv`

# Usage

`docker run --rm --env LATEXFILE=CV_Carlos --env OUTPUT_FOLDER=pdf -v $(pwd):/mnt casep/latex_cv`


