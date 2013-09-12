# $Id: Makefile,v 1.1 2012/08/25 00:31:23 jaehyeok Exp $

DVIPS = dvips
DVIPSPREFLAGS = -t letter
DVIPSPOSTFLAGS = -Ppdf

# TEXINPUTS := $(HOME)/latex/foiltex:$(HOME)/tex-archive/macros/latex/contrib/supported/feynmf:.:$(TEXINPUTS)
# MPINPUTS := $(HOME)/tex-archive/macros/latex/contrib/supported/feynmf:.:$(MPINPUTS)

# LATEX = env TEXINPUTS=$(TEXINPUTS) latex
LATEX = pdflatex
LATEXFLAGS =

DVI = $(TEXSOURCES:.tex=.dvi)

SORCE = thesis_jae.pdf 

ALLTEX = $(wildcard *.tex)
RERUN = '(No file .*\.toc|There were undefined references)'

.PHONY: all
all: $(SORCE)

%.pdf: %.tex $(wildcard *.tex) 
	@echo "====> LaTeX first pass"
	$(LATEX) $(LATEXFLAGS) $(<:.tex=)
	@if egrep -q $(RERUN) $*.log ; then echo "====> LaTeX rerun" && $(LATEX) $<; fi
	@if egrep -q $(RERUN) $*.log ; then echo "====> LaTeX rerun" && $(LATEX) $<; fi

.PHONY: clean
clean:
	rm -f *.pdf *.aux *.dvi *.log *.qsl *.sol *.lof *.lot *.toc *~
