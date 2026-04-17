SRCDIR=$(PWD)/src
MAIN=$(SRCDIR)/main
SCRIPTS=$(filter-out $(MAIN), $(wildcard $(SRCDIR)/*))

BINDIR=$(PWD)/bin
BIN=$(BINDIR)/dotsync

CONFDIR=$(HOME)/.config/dotsync
CONF=$(CONFDIR)/dotsync.conf

DOCS_DIR=$(PWD)/docs
DOCS_MD=$(wildcard $(DOCS_DIR)/*.md)
DOCS_MAN=$(DOCS_MD:.md=.1)
DOCS_MAN_DIR=$(DOCS_DIR)/groff
DOCS_GZ=$(DOCS_MD:.md=.1.gz)
DOCS_GZ_DIR=$(DOCS_DIR)/gzip
MANPATH=/usr/share/man/man1

INSTALL_DIR=/usr/bin
INSTALL_BIN=$(INSTALL_DIR)/dotsync

all: $(BIN) $(CONF) man

install: $(BIN) $(CONF) man-install
	@sudo mv $(BIN) $(INSTALL_BIN)
	@sudo chmod +x $(INSTALL_BIN)
	@echo "dotsync instalado con éxito"

$(CONF):
	@mkdir -p $(CONFDIR)
	@cp $(PWD)/config/dotsync.conf $(CONF)
	@echo "Configuración creada con éxito"

test: $(BIN)
	@bash $(BIN) $(ARGS)

$(BIN):
	@mkdir -p $(BINDIR)
	@echo '#!/usr/bin/env bash' > $(BIN)
	@cat $(SCRIPTS) | grep -v '^#!/usr/bin/env bash' >> $(BIN)
	@cat $(MAIN) | grep -v '^#!/usr/bin/env bash' >> $(BIN)
	@chmod +x $(BIN)
	@echo "Dotsync creado con éxito"

$(DOCS_DIR)/%.1: $(DOCS_DIR)/%.md
	@pandoc -s -t man $< -o $@

$(DOCS_DIR)/%.1.gz: $(DOCS_DIR)/%.1
	@gzip -f -k $<

man: $(DOCS_MAN) $(DOCS_GZ)
	@mkdir -p $(DOCS_MAN_DIR)
	@mkdir -p $(DOCS_GZ_DIR)
	@-mv $(DOCS_MAN) $(DOCS_MAN_DIR)
	@-mv $(DOCS_GZ) $(DOCS_GZ_DIR)
	@echo "Páginas man compiladas con éxito"

man-install: man
	@sudo cp $(DOCS_GZ_DIR)/* $(MANPATH)
	@sudo mandb > /dev/null
	@echo "Páginas man instaladas con éxito"

man-clean: 
	@rm -r $(DOCS_MAN_DIR) $(DOCS_GZ_DIR)


.PHONY: all install test man man-install man-clean $(BIN)
.PRECIOUS: $(BIN)	# No eliminar bin automáticamente
