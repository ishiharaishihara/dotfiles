DOTPATH := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
EXCLUSIONS := .git .gitignore .DS_Store
CANDIDATES := $(patsubst %/,%,$(wildcard .??*)) bin
DOTFILES := $(filter-out $(EXCLUSIONS),$(CANDIDATES))

install:
	@$(foreach file,$(DOTFILES), \
		test ! -e "$(HOME)/$(file)" || mv "$(HOME)/$(file)" "$(HOME)/$(file).bak"; \
		ln -sfnv "$(DOTPATH)/$(file)" "$(HOME)/$(file)";)

clean:
	@$(foreach file,$(DOTFILES), \
		test -L "$(HOME)/$(file)" && unlink "$(HOME)/$(file)" || true; \
		test ! -e "$(HOME)/$(file).bak" || mv "$(HOME)/$(file).bak" "$(HOME)/$(file)";)
