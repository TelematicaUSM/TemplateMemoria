sources = $(wildcard *.md)
targets = $(sources:.md=.tex)

fig_path = fig
figures = $(wildcard $(fig_path)/*.svg)
f_targets = $(figures:.svg=.pdf)


.PHONY: all clean

all: $(targets) $(f_targets)

%.tex: %.md
	pandoc $(global_pandoc_opt) -o $@ $<

$(fig_path)/%.pdf: $(fig_path)/%.svg
	inkscape $< --export-pdf=$@

clean:
	rm -f $(targets) $(f_targets)
