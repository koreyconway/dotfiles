# Download antigen with git if it doesn't exist already
if [ ! -r ~/.antigen/antigen.zsh ]; then
	[ ! command -v git > /dev/null 2>&1 ] ||
		(echo "Please install git to use antigen." &&
		return;)
	echo "Installing antigen into ~/.antigen/";
	git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi;

# Load antigen
source ~/.antigen/antigen.zsh

# Load plugins
antigen use oh-my-zsh
antigen bundle wd
antigen bundle zsh_reload
antigen bundle command-not-found
command -v git > /dev/null 2>&1 && antigen bundle git
command -v svn > /dev/null 2>&1 && antigen bundle svn
command -v sudo > /dev/null 2>&1 && antigen bundle sudo

# Set theme
antigen theme robbyrussell

# Vim as default editor
export EDITOR=vim

# Bindkeys for zsh to emacs style
bindkey -e

# Alias r to ranger
command -v ranger > /dev/null 2>&1 && alias r=ranger

# Alias for sensible defaults
#alias du="du -h"
#alias df="df -h"
#alias grep="grep -in"

# Add user bin to path (~/bin)
[ -d ~/bin ] && PATH=~/bin:$PATH

# OS Specific configuration
#case `uname` in
#	Darwin)
#		# mac
#		;;
#	Linux)
#		echo "On Linux"
#		;;
#esac

# Load local settings 
[ -r ~/.zshrc.local ] && source ~/.zshrc.local

antigen apply

