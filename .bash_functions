function unsource () { deactivate;
                        if [[ $PATH =~ $HOME/bin ]]
                        then
                           return 0 
                        else
                            export PATH=$PATH:$HOME/bin
                        fi
                    }
function bell () { echo -e \\07; }
function venv () { source ~/dev/$1/bin/activate;
                   if [[ $PATH =~ $HOME/bin ]]
                   then
                       return 0
                   else
                       export PATH=$PATH:$HOME/bin;
                   fi
        }
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
