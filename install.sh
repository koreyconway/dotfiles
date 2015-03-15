BASEDIR=$(cd $(dirname $0); pwd;)
OS=$(uname | tr [[:upper:]] [[:lower:]])

link_file() {
	# $1 is basename of file
	local srcname=$1
	local destname=$2
	[ -z $srcname ] && echo "No file given" && return
	[ -z $destname ] && destname=$srcname
	[ -e ~/.${destname} ] && [ ! -h ~/.${destname} ] \
		&& echo "~/.${1} file exists, moving to ~/.{1}.bk" \
		&&  mv ~/.${destname} ~/.${destname}.bk
	[ -h ~/.${destname} ] && echo "Overwritting link for ~/.${destname}"
	ln -fs ${BASEDIR}/${srcname} ~/.${destname} \
		|| echo "Failed to link ${destname}"
	echo "Linked ~/.${destname}"
}

link_file "zshrc"
link_file "tmux.conf"
link_file "screenrc"
link_file "vimrc"
link_file "gvimrc"

[ -f "${BASEDIR}/tmux.conf.${OS}" ] && \
	link_file "tmux.conf.${OS}" "tmux.conf.os"

if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
	mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
