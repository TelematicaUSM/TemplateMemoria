out_fn = memoria

.DEFAULT_GOAL = $(out_fn).pdf

pandoc_outputs = $(out_fn).pdf $(out_fn).tex
dep_empty_file = dependencies

.PHONY: clean

$(dep_empty_file):
	sudo apt-get install texlive-lang-spanish
	fmtutil --all
	touch $(dep_empty_file)

$(pandoc_outputs): config.md */*.md template.tex
	pandoc --template=template.tex --chapters -o $@ config.md

clean:
	rm -rf $(pandoc_outputs)
	find . -type f -regex '.*\.\(out\|lot\|log\|lof\|aux\|pdf\|toc\)' -delete

clean_all: clean
	rm -f $(dep_empty_file)
