.PHONY: all
all: az25.pdf az20.pdf az20.png az25.png 

az20.pdf: az.tex pages.sh
	./pages.sh 20 5
	xelatex az.tex
	rm -f *.log *.aux *.out
	mv az.pdf az20.pdf

az25.pdf: az.tex pages.sh
	./pages.sh 25 0
	xelatex az.tex
	rm -f *.log *.aux *.out
	mv az.pdf az25.pdf

az20.png: az20.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@

az25.png: az25.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@
