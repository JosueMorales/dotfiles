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

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
eval "$(nodenv init -)"


tunnel ()
{
  TUNNEL_HOST=$1
  TUNNEL_PORT=$2
  ssh -L $TUNNEL_PORT\:localhost:$TUNNEL_PORT josuemorales@$TUNNEL_HOST
}

#Adding ant
export ANT_HOME=/opt/ant/apache-ant-1.10.10
echo "ANT_HOME="$ANT_HOME
export ANT=$ANT_HOME/bin
echo "ANT="$ANT

#Adding git
#export GIT_HOME=/usr
#echo "GIT_HOME="$GIT_HOME
#export GIT=$GIT_HOME/bin
#echo "GIT="$GIT

#Adding Java
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export JAVA_13_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.0.1.jdk/Contents/Home
export JAVA_HOME=$JAVA_8_HOME
echo "JAVA_HOME="$JAVA_HOME

#Adding maven
export M2_HOME=/opt/maven/apache-maven-3.8.1
echo "M2_HOME="$M2_HOME
export M2=$M2_HOME/bin
echo "M2="$M2
export MAVEN_OPTS="-Xms512m -Xmx2048m"
echo "MAVEN_OPTS="$MAVEN_OPTS

#Adding MySQL
export MYSQL_HOME=/usr/local/mysql
echo "MYSQL_HOME="$MYSQL_HOME
export MYSQL=$MYSQL_HOME/bin
echo "MYSQL="$MYSQL


# Update our PATH
export PATH=$ANT:$GIT:$M2:$MYSQL:$PATH
echo "PATH="$PATH
