modules = $(wildcard */)
sub_target =

.PHONY: all clean $(modules)

all: $(modules)

clean: sub_target = clean
clean: $(modules)

$(modules):
	$(MAKE) -C $@ $(sub_target)
