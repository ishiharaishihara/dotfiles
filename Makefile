DOTPATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
EXCLUSIONS := .git .gitignore .DS_Store
CANDIDATES := $(wildcard .??*) bin
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

install:
	@$(foreach file, $(DOTFILES), ln -sfnv $(abspath $(file)) $(HOME)/$(file);) 

clean:
	@-$(foreach file, $(DOTFILES), unlink $(HOME)/$(file);)
	-rm -rf $(DOTPATH)

