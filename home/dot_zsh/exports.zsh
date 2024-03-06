# path
if [[ -d "$HOME/.local/bin/" ]]; then
	export PATH="$PATH:$HOME/.local/bin/"
fi
if [[ -d "/snap/bin/" ]]; then
	export PATH="$PATH:/snap/bin"
fi

# general exports
export EDITOR=$HOME/.bin/editor
export VISUAL=$HOME/.bin/editor
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
