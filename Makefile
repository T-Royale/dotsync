SRCDIR=$(PWD)/src
SCRIPTS=$(wildcard $(SRCDIR)/*)
BINDIR=$(PWD)/bin

all:
	@echo "aún no hay ninguna regla"

test:
	@cat $(SCRIPTS) > $(BINDIR)/test
	@bash $(BINDIR)/test $(ARGS)