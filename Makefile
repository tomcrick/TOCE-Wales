targets = tocewales-main.pdf

all: $(targets)

pdflatex = pdflatex -interaction=errorstopmode -halt-on-error

%.pdf: %.tex tocewales-body.tex tocewales.bib
	$(pdflatex) $<
	bibtex $*
	$(pdflatex) $<
	$(pdflatex) $<

clean:
	rm -f $(targets) *.aux *.log *.nav *.out *.snm *.toc *.vrb *.bbl *.blg *.synctex.gz

winopen:
	cmd start /c $(targets)
