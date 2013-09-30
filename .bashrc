#!/bin/bash

#
# .bashrc hack used to display the branch number you are currently working on
# Adopted from: http://hocuspokus.net/2009/07/add-git-and-svn-branch-to-bash-prompt/
#

parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | sed -e 's/.*\/branches\///' | awk '{print ""$1"" }'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

BLACK="\[\033[0;38m\]"
BLUE="\[\033[01;34m\]"

export PS1="$BLACK[\u@$BLACK\h $BLUE\$(parse_svn_branch)$BLACK] "
export PATH=$HOME/src/CHECKOUT/utils/svn-tools:$PATH
