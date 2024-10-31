.PHONY: all
all: az00.pdf az50.pdf az25.pdf az20.pdf az20.png az25.png az50.png

az00.pdf: az.tex pages.sh
	./pages.sh 4 0 1
	xelatex az.tex
	mv az.pdf $@

az20.pdf: az.tex pages.sh
	./pages.sh 20 5 0
	xelatex az.tex
	mv az.pdf $@

az25.pdf: az.tex pages.sh
	./pages.sh 25 0 0
	xelatex az.tex
	mv az.pdf $@

az50.pdf: az.tex pages.sh
	./pages.sh 50 0 1
	xelatex az.tex
	mv az.pdf $@

az20.png: az20.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@

az25.png: az25.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@

az50.png: az50.pdf
	pdftoppm -png -f 135 -l 135 $^ > $@

.PHONY: clean
clean:
	rm -f *.log *.aux *.out
