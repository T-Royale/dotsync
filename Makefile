SRCDIR=$(PWD)/src
MAIN=$(SRCDIR)/main
SCRIPTS=$(filter-out $(MAIN), $(wildcard $(SRCDIR)/*))
BINDIR=$(PWD)/bin
CONFDIR=$(HOME)/.config/dotsync
CONF=$(CONFDIR)/dotsync.conf

all: 
	@echo "aún no hay ninguna regla"

test:
	@mkdir -p $(BINDIR)
	@mkdir -p $(CONFDIR)
	@cp config/dotsync.conf $(CONF)
	@echo "#!/usr/bin/env bash" > $(BINDIR)/test
	@cat $(SCRIPTS) | grep -v '^#!/usr/bin/env bash' >> $(BINDIR)/test
	@cat $(MAIN) | grep -v '^#!/usr/bin/env bash' >> $(BINDIR)/test
	@bash $(BINDIR)/test $(ARGS)