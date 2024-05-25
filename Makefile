# Makefile to create LaTeX-compatible images from multiple GNUplot files
# and compile a LaTeX document using xelatex

# Variables
GNUPLOT := gnuplot
LATEX_IMG_DIR := images
PLOTS := $(wildcard $(LATEX_IMG_DIR)/*.gnu)
PDFS := $(PLOTS:.gnu=.pdf)
TEX_FILE := technical-depth.tex
TEX_PDF := $(TEX_FILE:.tex=.pdf)

# Build rule for all targets
all: images $(PDFS) $(TEX_PDF)

images:
	$(MAKE) -C images

# Pattern rule for creating a PDF from a GNUplot file
%.pdf: %.gnu
	$(GNUPLOT) -e "set terminal pdf color; set output '$@'" $<

# Rule for creating PDF from LaTeX file using xelatex
$(TEX_PDF): $(TEX_FILE)
	xelatex $<
	xelatex $<  # Running xelatex twice to resolve references, if any

deploy:
	cp images/sswe.svg ~/src/dool.in/source/images
	cp images/jswe.svg ~/src/dool.in/source/images
	cp images/pswe.svg ~/src/dool.in/source/images

# Clean rule
clean:
	rm -rf $(PDFS) $(TEX_PDF) *.out *.aux *.toc *.snm *.nav \
	*.log *.vrb *.bbl *.blg *.dvi *.ps *.eps *.backup \
	*.synctex.gz *.fdb_latexmk *.fls *.spl *.synctex.gz\(busy\)

.PHONY: all clean
