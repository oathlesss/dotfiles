# Define folder list
STOW_FOLDERS := zsh ghostty aerospace nvim tmux gitconfig

# Define color codes
GREEN := \033[0;32m
RED := \033[0;31m
RESET := \033[0m

.PHONY: stow
stow: ## Stow dotfiles
	@echo  "$(GREEN)Stowing dotfiles...$(RESET)"
	@for folder in $(STOW_FOLDERS); do \
		stow -t ~ $$folder && \
		echo  "$(GREEN)Successfully stowed: $$folder$(RESET)" || \
		echo  "$(RED)Failed to stow: $$folder$(RESET)"; \
	done
	@echo  "$(GREEN)Config files have been stowed.$(RESET)"

.PHONY: unstow
unstow: ## Unstow dotfiles
	@echo  "$(RED)Unstowing dotfiles...$(RESET)"
	@for folder in $(STOW_FOLDERS); do \
		stow -t ~ --delete $$folder && \
		echo  "$(RED)Successfully unstowed: $$folder$(RESET)" || \
		echo  "$(GREEN)Failed to unstow: $$folder$(RESET)"; \
	done
	@echo  "$(RED)Config files have been unstowed.$(RESET)"

