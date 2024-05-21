# !/bin/bash
set -e ;
# set -x
for FILEP in $( cat tracked.list ) ; do
    F="${FILEP/#\~/$HOME}"

        if [[ -e "${F}" ]] ; then
            echo File  $F on dest already exist.
        if [[ $(stat -c %i $(basename $F)) -eq  $(stat -c %i $F) ]] ; then
            echo echo OK already linked ; continue
        else
            echo renaming as a bak && mv -v $F "${F}_$(date +%s).bak"
        fi
    fi
        echo Restoring $F
    ln -v $(basename $F) $F
    # md5sum $F
    echo ''
done
