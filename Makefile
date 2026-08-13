DOTPATH := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
EXCLUSIONS := .git .gitignore .DS_Store
CANDIDATES := $(patsubst %/,%,$(wildcard .??*)) bin
DOTFILES := $(filter-out $(EXCLUSIONS),$(CANDIDATES))

install:
	@$(foreach file,$(DOTFILES), ln -sfnv "$(DOTPATH)/$(file)" "$(HOME)/$(file)";)

clean:
	@$(foreach file,$(DOTFILES), test -L "$(HOME)/$(file)" && rm -f "$(HOME)/$(file)" || true;)
