MAIN=document

all: $(MAIN).pdf
	
$(MAIN).pdf: *.tex 
	latexmk -pdf $(MAIN).tex

clean: 
	rm *.aux *.bcf *.blg *.fdb_latexmk *.fls *.log *.nav *.out *.pdf *.run.xml *.snm *.toc
