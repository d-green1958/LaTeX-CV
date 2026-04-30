singlecol: singlecol.tex
	pdflatex singlecol.tex
	pdflatex singlecol.tex
	
doublecol: doublecol.tex
	pdflatex doublecol.tex
	pdflatex doublecol.tex
	
all: singlecol doublecol

tidy:
	rm -vf *.aux *.log *.out
	
clean:
	rm -vf *.pdf *.aux *.log *.out
