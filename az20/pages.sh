#!/bin/bash -e

PAGES=$1
EXTRA_LINES=$2
DOUBLE=$3
if [ "$DOUBLE" == "1" ]; then
SHIFT=$((PAGES / 2))
else
  SHIFT=$PAGES
fi

{
echo "\\setlength{\\extrarowheight}{1pt}"
for l in {A..Z}
do
  for n in $(seq 1 ${PAGES})
  do
    echo "\\newpage"
    echo "\\centering"
    echo "\\hypertarget{${l}-${n}}{\\Huge ${l}\\textsubscript{{${n}}}}\\hfill"
    echo "\\par\\vspace{1mm}\\raggedright"

    for nn in $(seq 1 ${SHIFT})
    do
      if [ "${nn}" == "${n}" ]; then
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{white}{yellow}{\\makebox[6mm][c]{\\Large\\textcolor{black} ${nn}}}}"
      else
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{white}{white}{\\makebox[6mm][c]{\\Large ${nn}}}}"
      fi
        nnr=$(($nn + $SHIFT))
        if [ "${DOUBLE}" == "1" ]; then
          if [ "${nnr}" == "${n}" ]; then
            echo "\\hfill\\hyperlink{${l}-${nnr}}{\\fcolorbox{white}{yellow}{\\makebox[6mm][r]{\\Large ${nnr}}}}"
          else
            echo "\\hfill\\hyperlink{${l}-${nnr}}{\\fcolorbox{white}{white}{\\makebox[6mm][r]{\\Large ${nnr}}}}"
          fi
        fi
      echo "{\\color{gray!80}\\hrule}"
      echo "\\par\\vspace{3mm}"
    done
    echo "\\vspace{-3mm}"
    if [ "${EXTRA_LINES}" != "0" ]; then
      for nn in $(seq 1 ${EXTRA_LINES})
      do
        echo "\\par\\vspace{8mm}"
        echo "{\\color{gray!80}\\hrule}"
      done
    fi
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
