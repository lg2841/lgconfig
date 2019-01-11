
CURR_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURR_DIR := $(shell dirname $(CURR_PATH))

GITRC := $(wildcard ~/.gitconfig)
VIMRC := $(wildcard ~/.vimrc)
ZSHRC := $(wildcard ~/.zshrc)
SSHRC := $(wildcard ~/.ssh)
TMUXRC := $(wildcard ~/.tmux.conf)

all:exports gitconfig init_setup minicom monps rm_guest sudoers tftp vimrc zsh

test:
ifeq ($(VIMRC), )
	@echo yes
else
	@echo no
endif

help:
	@echo curr dir is:
	@echo $(CURR_DIR)

#####################################################################
# dotfiles

minicom:
	rm -f ~/.minirc.dfl
	ln -s ~/steel/working/repos/lgconfig/dotfiles/minirc.dfl ~/.minirc.dfl
	@echo **** created link file ~/.minirc.dfl


#######################################
gitconfig:
ifneq ($(GITRC), )
	mv $(GITRC)  $(GITRC)_bak
endif
	ln -s $(CURR_DIR)/dotfiles/gitconfig ~/.gitconfig
	@echo **** created link file ~/.gitconfig


#######################################
tmux:
ifneq ($(TMUXRC), )
	mv $(TMUXRC)  $(TMUXRC)_bak
endif
	ln -s $(CURR_DIR)/dotfiles/tmux.conf ~/.tmux.conf
	sudo apt-get install ruby
	sudo apt-get install rubygems-integration
	sudo gem install tmuxinator
	@echo **** install tmuxinator and create link file ~/.tmux.conf
	#git clone https://github.com/tmuxinator/tmuxinator.git ~/steel/working/repos/tmuxinator


#######################################
vim:
ifneq ($(VIMRC), )
	mv $(VIMRC)  $(VIMRC)_bak
endif
	ln -s $(CURR_DIR)/dotfiles/vimrc ~/.vimrc
	@echo **** created link file ~/.vimrc


#######################################
zsh:
ifneq ($(ZSHRC), )
	mv $(ZSHRC)  $(ZSHRC)_bak
endif
	ln -s $(CURR_DIR)/dotfiles/zshrc ~/.zshrc
	git clone https://github.com/rimraf/k.git ~/.oh-my-zsh/plugins/k
	@echo **** created link file ~/.zshrc


#######################################
ssh:
ifneq ($(SSHRC), )
	mv $(SSHRC)  $(SSHRC)_bak
endif
	ln -s $(CURR_DIR)/dotfiles/ssh ~/.ssh
	@echo **** created link file ~/.ssh


#####################################################################
# etc files
sudoers:/etc/sudoers
	@echo **** Copying /etc/sudoers ****
	cp -f /etc/sudoers ./sudoers

tftp:/etc/xinetd.d/tftp
	@echo **** Copying /etc/xinetd.d/tftp ****
	cp -f /etc/xinetd.d/tftp ./tftp

exports:/etc/exports
	@echo **** Copying /etc/exports ****
	cp -f /etc/exports .
