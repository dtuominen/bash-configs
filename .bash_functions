#constants
function url() {
    open http://$1
}
function venv () { 
    source ~/.venv/$1/bin/activate;
}
function bell () { echo -e \\07; }
function mkcd { mkdir $1 && cd $1; }
function displayhidden () { 
    if [ $# -eq 1 ];
    then
        defaults write com.apple.finder AppleShowAllFiles $1
        killall Finder
    fi
    echo 'This needs an argument of TRUE or FALSE.';
}
function sync () { if [[ -f $PWD/manage.py ]]; then
                        ./manage.py syncdb | grep '^ -' | sed 's/[- ]*//' \
                        | xargs -n 1 ./manage.py migrate;
                        return 0
                   fi
                   echo "YOU DONE FUCKED UP";
        }
function tab(){
    echo -e "\033];$1\007," 
}
# cdf: cd to the directory in the Finder's front window
alias cdf='cd "$(~/bin/posd)"'

# posfind: search the directory frontmost in the Finder
function posfind { find "`~/bin/posd`" -name "*$1*"; }

# posgrep: grep the directory frontmost in the Finder
function posgrep { grep -iIrn "$1" "`~/bin/posd`"; }
