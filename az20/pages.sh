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
    echo "\\par"
    echo "\\noindent\\vspace{1cm}"
    echo "\\setlength{\\extrarowheight}{3pt}"
    echo "\\begin{tabularx}{\\textwidth}{lX}"
    echo "\\arrayrulecolor{gray!80}"
    for nn in {0..20}
    do
      if [ "${nn}" == "${n}" ]; then
        echo "\\hyperlink{${l}-${nn}}{\\cellcolor{black}{{\\textcolor{white}${nn}}}} & \\\\ \\cline{2-2}"
      else
        echo "\\hyperlink{${l}-${nn}}{${nn}} & \\\\ \\cline{2-2}"
      fi
      echo "& \\\\ \\cline{2-2}"
    done
    echo "\\end{tabularx}"
  done
done
} > pages.tex
