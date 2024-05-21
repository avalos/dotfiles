# !/bin/bash
set -e ;
# set -x
for FILEP in $( cat tracked.list ) ; do
    F="${FILEP/#\~/$HOME}"
        if [[ ! -e "${F}" ]] ; then
                echo Source $F not found. Skipping
        else
        echo linking $F . ;
        md5sum $F
        if [[ -e $(basename $F) ]] ; then
          [[ $(stat -c %i $(basename $F)) -eq  $(stat -c %i $F) ]] && echo echo OK already linked || echo echo WRN different inode found in $F . Ignoring file
        else
           #echo ln $F .
           ln -v $F .
        fi
        echo ''
        fi

done
