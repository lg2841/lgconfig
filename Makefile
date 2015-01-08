
all:exports gitconfig init_setup minirc.dfl monps rm_guest sudoers tftp vimrc zshrc

exports:/etc/exports
	echo **** Copying /etc/exports ****
	cp -f /etc/exports .

gitconfig:~/.gitconfig
	echo **** Copying ~/.gitconfig ****
	cp -f ~/.gitconfig ./gitconfig

minirc.dfl:~/.minirc.dfl
	echo **** Copying ~/.minirc.dfl ****
	cp -f ~/.minirc.dfl ./minirc.dfl

sudoers:/etc/sudoers
	echo **** Copying /etc/sudoers ****
	cp -f /etc/sudoers ./sudoers

tftp:/etc/xinetd.d/tftp
	echo **** Copying /etc/xinetd.d/tftp ****
	cp -f /etc/xinetd.d/tftp ./tftp

vimrc:~/.vimrc
	echo **** Copying ~/.vimrc ****
	cp -f ~/.vimrc ./vimrc
