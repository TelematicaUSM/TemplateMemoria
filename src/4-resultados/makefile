sources = $(wildcard *.md)
targets = $(sources:.md=.tex)


.PHONY: all clean

all: $(targets)

%.tex: %.md
	pandoc $(global_pandoc_opt) -o $@ $<

clean:
	rm -f $(targets)