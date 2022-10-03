Clone TPM:
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#installing TMUX plugins
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'
Reload TMUX environment so TPM is sourced:

# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf











------------------------------------------------------------------------------


# Send prefix
set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix
 
# Use Alt-arrow keys to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
 
# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window
 
# Mouse mode
setw -g mouse on

# bind-key          [ copy-mode
setw -g mode-keys vi
 
# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v
 
# Easy config reload
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded."


# vim keys in copy or choice mode
set-window-option -g mode-keys vi

# copying selection vim style
# http://jasonwryan.com/blog/2011/06/07/copy-and-paste-in-tmux/
# https://github.com/myfreeweb/dotfiles/blob/master/tmux.conf
bind-key Escape copy-mode			# enter copy mode; default [
bind-key -t vi-copy Escape cancel		# exit copy mode; or hit q
bind-key p paste-buffer				# paste; default ]
bind-key -t vi-copy v begin-selection		# begin visual mode
bind-key -t vi-copy V select-line		# visual line
bind-key -t vi-copy y copy-selection		# yank
bind-key -t vi-copy r rectangle-toggle 		# visual block toggle

# read and write and delete paste buffer ( xsel method)
# https://wiki.archlinux.org/index.php/Tmux#ICCCM_Selection_Integration
# ctrl+shift+v
bind-key < command-prompt -p "send to tmux:" "run-shell 'tmux set-buffer -- \"$(xsel -o -b)\"'"
bind-key > command-prompt -p "send to xsel:" "run-shell 'tmux show-buffer | xsel -i -b'"
bind-key + command-prompt "delete-buffer"
