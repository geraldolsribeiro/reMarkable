#!/bin/bash -e

{
for l in {A..Z}
do
  for n in {0..20}
  do
    echo "\\newpage"
    # Page number
    echo "\\hypertarget{${l}-${n}}{{\\Huge ${l}-${n}}}"
    echo "\\hfill"

    # Horizontal links for letters
    echo "\\begin{tabularx}{15cm}{XXXXXXXXXXXXXXXXXXXXXXXXXX}"
    for ll in {A..Z}
    do
      if [ "${ll}" == "${l}" ]; then
        echo -n "\\hyperlink{${ll}-0}{\\cellcolor{black}{\\textcolor{white}${ll}}}"
      else 
        echo -n "\\hyperlink{${ll}-0}{${ll}}"
      fi
      if [ "${ll}" != "Z" ]; then
        echo -n " &"
      fi
    done
    echo
    echo "\\end{tabularx}"

    # Vertical links to ?.number
    for nn in {0..20}
    do
      echo ""
      echo "\\vspace{5mm}"
      echo "\\hyperlink{${l}-${nn}}{${nn}}"
    done
  done
done
} > pages.tex
