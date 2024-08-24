#
# ~/.bashrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto '
alias grep='grep --color=auto '

PS1='[\u@\h \W]\$ '



# --------------- User added -----------------
# run using, "source .bashrc"

# Load aliases from non-empty file
if [ -f ~/.bashrc_aliases ]; then
   source ~/.bashrc_aliases
fi

# Load functions (and aliases tied to them) from non-empty file
if [ -f ~/.bashrc_functions ]; then
   source ~/.bashrc_functions
fi


# Alias used
#fortune | cowsay
#pokemon-colorscripts --random --shiny 
pokemon --random --shiny 


# "\[" and "\]" are MANDATORY. Bash needs them to properly count characters
#You need "-e" so it's allowed to INCLUDE backslashes
function __red {
	echo -e "\[\e[31m\]"$1"\[\e[0m\]"
}
function __green {
	echo -e "\[\e[32m\]"$1"\[\e[0m\]"
}
function __blue {
	echo -e "\[\e[34m\]"$1"\[\e[0m\]"
}
function __purple {
	echo -e "\[\e[35m\]"$1"\[\e[0m\]"
}

# Needed so __git_ps1 works
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'

#PS1="${debian_chroot:+($debian_chroot)}[$(__blue "\u")@$(__purple "\h") {$(__green "\W")}]\${PS1_CMD1}\$ "
PS1="${debian_chroot:+($debian_chroot)}"			# Chroot Flags 
PS1="${PS1}[$(__blue "\u")@$(__purple "\h") {$(__green "\W")}]"	# Username, Host, and Curr. Dir.
#PS1="${PS1}[(__purple "\u@\h") {$(__green "\W")}]"	# Username, Host, and Curr. Dir.
PS1="${PS1}$(__red \${PS1_CMD1})"				# Git Branch
PS1="${PS1}\$ "							# Prompt Sign and extra space

alias tree="tree --dirsfirst -C"

# To edit SynthShell, edit here:
# ~/.config/synth-shell/synth-shell-prompt.config 


# --------------- Synth Shel ----------------
##-----------------------------------------------------
## synth-shell-greeter.sh
#if [ -f ~/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source ~/.config/synth-shell/synth-shell-greeter.sh
#fi

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f ~/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source ~/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
#if [ -f ~/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source ~/.config/synth-shell/better-ls.sh
#fi

##-----------------------------------------------------
## alias
if [ -f ~/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source ~/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f ~/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source ~/.config/synth-shell/better-history.sh
fi
