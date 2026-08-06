# path
if [[ -d "$HOME/.local/bin" ]]; then
	case ":$PATH:" in
	  *":$HOME/.local/bin:"*) ;;
	  *) export PATH="$HOME/.local/bin:$PATH" ;;
	esac
fi
if [[ -d "/snap/bin/" ]]; then
	export PATH="$PATH:/snap/bin"
fi

# general exports
export EDITOR=$HOME/.bin/editor
export VISUAL=$HOME/.bin/editor
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
mkdir -p "$ZSH_CACHE_DIR/completions"

export ZSH_AUTOSUGGEST_USE_ASYNC=1

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
