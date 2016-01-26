template = template/template.tex
config = config.yaml
global_pandoc_opt = --chapters
export global_pandoc_opt
src_dir = src
src_files = $(wildcard $(src_dir)/*) \
            $(wildcard $(src_dir)/*/*) \
            $(wildcard $(src_dir)/*/*/*)
out_fn = memoria
main_out = $(out_fn).pdf
tex_out = $(out_fn).tex

glosario = $(out_fn).gls
glos_glg = $(out_fn).glg
glos_glo = $(out_fn).glo
glos_aux = $(glos_glo) $(out_fn).xdy

.DEFAULT_GOAL = $(main_out)
.PHONY: view clean clean_all

$(tex_out): $(template) $(config)
	pandoc --latex-engine=xelatex --template=$(template) \
	       --toc $(global_pandoc_opt) -o $@ $(config)

$(glos_aux): $(tex_out)

$(glosario): $(glos_aux)
	xindy  -L spanish-modern -C utf8 -I xindy \
	       -M $(out_fn) -t $(glos_glg) -o $@ \
		   $(glos_glo)

$(main_out): $(glosario)

$(glos_aux) $(main_out): $(src_files)
	$(MAKE) -C $(src_dir)
	xelatex $(tex_out)

view: $(main_out)
	xdg-open $^

clean: clean_aux
	rm -f $(main_out)
	$(MAKE) -C $(src_dir) clean

clean_aux:
	rm -f $(glosario) $(glos_glg) $(glos_aux) $(tex_out) \
	      $(addprefix $(out_fn).,aux log out toc)
