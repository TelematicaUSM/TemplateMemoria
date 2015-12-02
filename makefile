out_fn = memoria

.DEFAULT_GOAL = $(out_fn).pdf

pandoc_outputs = $(out_fn).pdf $(out_fn).tex
tmp_dir = tmp
thesis_files = thesis.cls thesis.sty thema.cls thema.sty
dep_empty_file = dependencies

.PHONY: clean

$(dep_empty_file):
	sudo apt-get install texlive-lang-spanish
	fmtutil --all
	touch $(dep_empty_file)

$(thesis_files):
	mkdir $(tmp_dir)
	cd $(tmp_dir) && \
	wget http://ftp.inf.utfsm.cl/pub/tex-archive/macros/latex/contrib/thesis/thesis.dtx \
	     http://ftp.inf.utfsm.cl/pub/tex-archive/macros/latex/contrib/thesis/install.01 && \
	latex install.01 && \
	mv thesis.cls thesis.sty thema.cls thema.sty ..
	rm -rf $(tmp_dir)

$(pandoc_outputs): */*.md template.tex thesis.cls
	pandoc --template=template.tex --chapters -o $@ cap2/cap2.md

clean:
	rm -rf $(thesis_files) $(pandoc_outputs)
	find . -type f -regex '.*\.\(out\|lot\|log\|lof\|aux\|pdf\|toc\)' -delete

clean_all: clean
	rm -f $(dep_empty_file)
