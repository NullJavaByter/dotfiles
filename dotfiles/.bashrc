#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

export LANG="C"

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# -----------------------------------
#  Create a new permanent bash alias
#
#  @param $1 - name
#  @param $2 - definition
# -----------------------------------
new-alias () { 
  if [ -z "$1" ]; then
    echo "alias name:" && read NAME
  else
    NAME=$1
  fi

  if alias $NAME 2 > /dev/null > /dev/null; then
    echo "alias $NAME already exists - continue [y/n]?" && read YN
    case $YN in
      [Yy]* ) echo "okay, let's proceed.";;
      [Nn]* ) return;;
      * ) echo "invalid response." && return;;
    esac
  fi

  if [ -z "$2" ]; then
    echo "alias definition:" && read DEFINTION
  else
    DEFINTION="$2"
  fi

  if [ -f ~/.bash_aliases ]; then
    echo "alias $NAME=\"$DEFINTION\"" >> ~/.bash_aliases
  else
    echo "alias $NAME=\"$DEFINTION\"" >> ~/.bashrc
  fi

  alias $NAME="$DEFINTION"
}

source ~/.local/share/blesh/ble.sh
