function mkcd { mkdir $1 && cd $1; }
function displayhidden () { 
    if [ $# -eq 1 ];
    then
        defaults write com.apple.finder AppleShowAllFiles $1
        killall Finder
    fi
    echo 'This needs an argument of TRUE or FALSE.';
}

