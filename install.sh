BASEDIR=$(dirname $(readlink -f "$0"))

echo $BASEDIR

link_file() {
	# $1 is basename of file
	[ -z $1 ] && echo "No file given" && return
	[ -e ~/.${1} ] && [ ! -h ~/.${1} ] \
		&& echo "~/.${1} file exists, moving to ~/.{1}.bk" \
		&&  mv ~/.${1} ~/.${1}.bk
	[ -h ~/.${1} ] && echo "Overwritting link for ~/.${1}"
	ln -fs ${BASEDIR}/${1} ~/.${1} \
		|| echo "Failed to link ${1}"
}

link_file "zshrc"
link_file "tmux.conf"
link_file "screenrc"
link_file "vimrc"

if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
	mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
