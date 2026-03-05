SRCDIR=$(PWD)/src
MAIN=$(SRCDIR)/main
SCRIPTS=$(filter-out $(MAIN), $(wildcard $(SRCDIR)/*))
BINDIR=$(PWD)/bin

all:
	@echo "aún no hay ninguna regla"

test:
	@mkdir -p $(BINDIR)
	@echo "#!/usr/bin/env bash" > $(BINDIR)/test
	@cat $(SCRIPTS) | grep -v '^#!/usr/bin/env bash' >> $(BINDIR)/test
	@cat $(MAIN) | grep -v '^#!/usr/bin/env bash' >> $(BINDIR)/test
	@bash $(BINDIR)/test $(ARGS)