.PHONY: all
all: az20.png

az20.pdf: az20.tex pages.sh
	./pages.sh
	xelatex az20.tex
	rm -f *.log *.aux *.out

az20.png: az20.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@
