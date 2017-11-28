
cd text\bib
wget --timeout=5 http://drsmorey.org/bibtex/bibfile.php
IF %ERRORLEVEL% EQU 0 (
  iconv -f CP1252 -t UTF-8 bibfile.php > bibfile.bib
  move bibfile.php bibfile.raw.bib
)

cd ..\..

Rscript -e "rmarkdown::render('text/html_paper/paper_html.Rmd')"
Rscript -e "rmarkdown::render('text/papaja_paper/paper_pdf.Rmd')" 

Rscript -e "beepr::beep(); Sys.sleep(1);" 

echo Done.