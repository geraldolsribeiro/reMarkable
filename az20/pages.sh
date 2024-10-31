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
echo "\\setlength{\\extrarowheight}{-1pt}"
for l in {A..Z}
do
  for n in $(seq 1 ${PAGES})
  do
    echo "\\newpage\\centering%"
    echo "\\color{blue}%"
    echo "\\hypertarget{${l}-${n}}{\\Huge ${l}\\textsubscript{{${n}}}}%"
    echo "\\par\\vspace{1mm}\\raggedright%"
    echo "\\color{gray}%"

    for nn in $(seq 1 ${SHIFT})
    do
      if [ "${nn}" == "${n}" ]; then
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{yellow}{yellow}{\\makebox[5mm][c]{{\\color{blue}\\Large ${nn}}}}}%"
      else
        echo "\\hyperlink{${l}-${nn}}{\\fcolorbox{white}{white}{\\makebox[5mm][c]{\\Large ${nn}}}}%"
      fi
        nnr=$(($nn + $SHIFT))
        if [ "${DOUBLE}" == "1" ]; then
          if [ "${nnr}" == "${n}" ]; then
            echo "\\hfill\\hyperlink{${l}-${nnr}}{\\fcolorbox{yellow}{yellow}{\\makebox[5mm][c]{{\\color{blue}\\Large ${nnr}}}}}%"
          else
            echo "\\hfill\\hyperlink{${l}-${nnr}}{\\fcolorbox{white}{white}{\\makebox[5mm][c]{\\Large ${nnr}}}}%"
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
    echo "\\vfill"
    echo "\\begin{tabularx}{15cm}{XXXXXXXXXXXXXXXXXXXXXXXXXX}"
    for ll in {A..Z}
    do
      if [ "${ll}" == "${l}" ]; then
        echo -n "\\hyperlink{${ll}-1}{\\cellcolor{yellow}{{\\color{blue}{\\Large ${ll}}}}}"
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
