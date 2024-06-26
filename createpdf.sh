# Load variables
set -a
source .env
set +a

# Name of html file
HTMLFILE="resume.html"

# Name of final PDF file
PDFFILE="resume.pdf"

# Replace variables in html file
(envsubst < $HTMLFILE) > print.html

# Create .venv if it doesn't exist
if [ ! -d .venv ]; then
    python3 -m venv .venv
fi

# Run Python to insert content
source ./.venv/bin/activate
python3 main.py

# Create PDF
weasyprint print.html $PDFFILE

# Clean up
# rm print.html

# Open PDF with the system's standard pdf viewer
open $PDFFILE
