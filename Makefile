
all:exports gitconfig init_setup minirc.dfl monps rm_guest sudoers tftp vimrc zshrc

#####################################################################
# dotfiles
gitconfig:
	rm ~/.gitconfig
	ln -s ~/working/repos/lgconfig/dotfiles/gitconfig ~/.gitconfig
	echo **** created link file ~/.gitconfig ****

minirc.dfl:
	rm ~/.minirc.dfl
	ln -s ~/working/repos/lgconfig/dotfiles/minirc.dfl ~/.minirc.dfl
	echo **** created link file ~/.minirc.dfl ****

tmux:
	rm ~/.tmux.conf
	ln -s ~/working/repos/lgconfig/dotfiles/tmux.conf ~/.tmux.conf
	echo **** created link file ~/.tmux.conf ****

vimrc:
	rm ~/.vimrc
	ln -s ~/working/repos/lgconfig/dotfiles/vimrc ~/.vimrc
	echo **** created link file ~/.vimrc ****

zshrc:
	rm ~/.zshrc
	ln -s ~/working/repos/lgconfig/dotfiles/zshrc ~/.zshrc
	echo **** created link file ~/.zshrc ****


#####################################################################
# etc files
sudoers:/etc/sudoers
	echo **** Copying /etc/sudoers ****
	cp -f /etc/sudoers ./sudoers

tftp:/etc/xinetd.d/tftp
	echo **** Copying /etc/xinetd.d/tftp ****
	cp -f /etc/xinetd.d/tftp ./tftp

exports:/etc/exports
	echo **** Copying /etc/exports ****
	cp -f /etc/exports .
