
all:exports gitconfig init_setup minirc.dfl monps rm_guest sudoers tftp vimrc zshrc

#####################################################################
# dotfiles
gitconfig:
	rm -f ~/.gitconfig
	ln -s ~/working/repos/lgconfig/dotfiles/gitconfig ~/.gitconfig
	echo **** created link file ~/.gitconfig

minirc.dfl:
	rm -f ~/.minirc.dfl
	ln -s ~/working/repos/lgconfig/dotfiles/minirc.dfl ~/.minirc.dfl
	echo **** created link file ~/.minirc.dfl

tmux:
	rm -f ~/.tmux.conf
	ln -s ~/working/repos/lgconfig/dotfiles/tmux.conf ~/.tmux.conf
	git clone https://github.com/tmuxinator/tmuxinator.git ~/working/repos/tmuxinator
	sudo apt-get install rubygems-integration
	sudo gem tmuxinator
	echo **** install tmuxinator and create link file ~/.tmux.conf

vimrc:
	rm -f ~/.vimrc
	ln -s ~/working/repos/lgconfig/dotfiles/vimrc ~/.vimrc
	echo **** created link file ~/.vimrc

zshrc:
	rm -f ~/.zshrc
	ln -s ~/working/repos/lgconfig/dotfiles/zshrc ~/.zshrc
	git clone https://github.com/rimraf/k.git ~/.oh-my-zsh/plugins/k
	echo **** created link file ~/.zshrc

ssh:
	rm -rf ~/.ssh
	ln -s ~/working/repos/lgconfig/dotfiles/ssh ~/.ssh
	echo **** created link file ~/.ssh


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
