# Use this .bash_profile for customizations.
# This file is loaded from ~/.bash_profile,
# which is owned by the daptiv dotfiles repository


export USER_PROFILE_LOADED="1"

Reset="\[\033[0m\]"
Red="\[\033[1;31m\]"
Green="\[\033[1;32m\]"
Blue="\[\033[1;34m\]"

gitPs1()
{
        branch="$(git symbolic-ref HEAD 2> /dev/null)";

        if [ -n "$branch" ]; then
                printf " (%s)" "${branch##refs/heads/}";
        fi
}

export PS1="$Green\u@\h$Reset:$Blue\w$Reset"'$(git branch > /dev/null 2>&1; \
if [ $? -eq 0 ]; then \
        echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
        if [ $? -eq 0 ]; then \
                echo "'$Green'"; \
        else \
                echo "'$Red'"; \
        fi)$(gitPs1 " (%s)")'$Reset'"; \
fi)'"\$ "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
