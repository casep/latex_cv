# Compile

`docker build . -t casep/didcot_charity`

# Usage

`docker run --rm --env LATEXFILE=Charity_Steward_report_20231110 --env OUTPUT_FOLDER=pdf -v $(pwd):/mnt casep/didcot_charity`


