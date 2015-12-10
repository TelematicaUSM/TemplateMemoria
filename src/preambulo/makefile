sources = $(wildcard *.md)

.PHONY: all clean

all: $(sources:.md=.tex)

%.tex: %.md
	pandoc $(global_pandoc_opt) -o $@ $^

clean:
	rm -f *.tex
