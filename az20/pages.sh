#!/bin/bash -e

{
echo "\\setlength{\\extrarowheight}{1pt}"
for l in {A..Z}
do
  for n in {1..20}
  do
    echo "\\newpage"
    echo "\\centering"
    echo "\\hypertarget{${l}-${n}}{\\Huge ${l}\\textsubscript{{${n}}}}\\hfill"
    echo "\\par\\vspace{1mm}\\raggedright"

    for nn in {1..20}
    do
      if [ "${nn}" == "${n}" ]; then
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{white}{yellow}{\\makebox[6mm][c]{\\Large\\textcolor{black} ${nn}}}}"
      else
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{white}{white}{\\makebox[6mm][c]{\\Large ${nn}}}}"
      fi
      echo "{\\color{gray!50}\\hrule}"
      echo "\\par\\vspace{3mm}"
    done
    echo "\\vspace{-3mm}"
    for nn in {0..4}
    do
      echo "\\par\\vspace{8mm}"
      echo "{\\color{gray!50}\\hrule}"
    done
    echo "\\centering"
    echo "\\par\\vspace{6mm}\\noindent"
    echo "\\begin{tabularx}{15cm}{XXXXXXXXXXXXXXXXXXXXXXXXXX}"
    for ll in {A..Z}
    do
      if [ "${ll}" == "${l}" ]; then
        echo -n "\\hyperlink{${ll}-1}{\\cellcolor{yellow}{\\textcolor{black}{\\Large ${ll}}}}"
      else 
        echo -n "\\hyperlink{${ll}-1}{\\Large ${ll}}"
      fi
      if [ "${ll}" != "Z" ]; then
        echo -n " &"
      fi
    done
    echo
    echo "\\end{tabularx}"
  done
done
} > pages.tex
