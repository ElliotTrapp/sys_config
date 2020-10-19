SYS_CONFIG=$HOME/sys_config
if [ -d "$SYS_CONFIG" ]; then
    source $SYS_CONFIG/evars
    configs=("funcs" "evars" "alias" "zshrc" "vimrc")
    for CONFIG in ${configs[@]}; do
        if [ ! -f "$HOME/.$CONFIG" ]; then
            echo "Creating $CONFIG sym link"
            ln -s $SYS_CONFIG/$CONFIG ~/.$CONFIG
        fi
    done
    
    home_dirs=("Work" "School" "Notes" "HomeAutomation" "FileUtils")
    for HOME_DIR in ${home_dirs[@]}; do
        if [ ! -d "$HOME/$HOME_DIR" ]; then
            echo "Creating $HOME_DIR in $HOME"
            mkdir -p $HOME/$HOME_DIR
        fi
    done
fi
