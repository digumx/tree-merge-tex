# Makefile for papers
MAIN = document
.PHONY: clean open spell

all: $(MAIN).pdf

$(MAIN).pdf: *.tex *.bib
	latexmk -pdf $(MAIN).tex

spell:
	for f in `find . -name "*.tex"`; do aspell -t -l en_us -c $$f; done;
#	aspell -t -l en_us -c $(MAIN).tex

zip:
	zip -r $(MAIN).zip *.tex *.tex *.bib *.cls

clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).bst $(MAIN).dvi $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).idx $(MAIN).lof $(MAIN).log $(MAIN).nav $(MAIN).out $(MAIN).pdf $(MAIN).snm $(MAIN).synctex.gz $(MAIN).toc $(MAIN).run.xml $(MAIN)-blx.bib
	rm -f $(MAIN).zip
	rm -f *.bak *.bak *.auto *.log *.aux *.log *~ *~ */texput.log

cleanall:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).bst $(MAIN).dvi $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).idx $(MAIN).lof $(MAIN).log $(MAIN).nav $(MAIN).out $(MAIN).pdf $(MAIN).snm $(MAIN).synctex.gz $(MAIN).toc $(MAIN).run.xml $(MAIN)-blx.bib
	rm -f $(MAIN).zip
	rm -f *.aux *.bbl *.blg *.bst *.dvi *.fdb_latexmk *.fls *.idx *.lof *.log *.nav *.out *.snm *.synctex.gz *.toc *.run.xml *-blx.bib 
	rm -f *.bak *.bak *.auto *.log *.aux *.log *~ *~ */texput.log
