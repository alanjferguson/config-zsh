SHELL=/bin/sh
HOME_DIR=$(HOME)
CONFIG_ZSHRC_PATH=$(PWD)/zshrc
DOT_ZSHRC_PATH=$(HOME)/.zshrc

all: backup install

backup: $(DOT_ZSHRC_PATH)
	echo "$(DOT_ZSHRC_PATH) exists"
	if [[ -L $(DOT_ZSHRC_PATH) ]] ; \
		then \
		echo "$(DOT_ZSHRC_PATH) is just a symlink"; \
		rm $(DOT_ZSHRC_PATH); \
	else \
		echo "$(DOT_ZSHRC_PATH) is a file, moving to $(DOT_ZSHRC_PATH).old"; \
		mv $(DOT_ZSHRC_PATH){,.old}; \
	fi

install:
	ln -s $(PWD)/zshrc $(DOT_ZSHRC_PATH)

