SRCDIR=$(PWD)/src
SCRIPTS=$(wildcard $(SRCDIR)/*)

all:
	@echo "aún no hay ninguna regla"

test:
	@cat $(SCRIPTS) | bash