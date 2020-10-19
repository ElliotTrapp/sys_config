echo "WARNING: This script will remove all sys_config files and directories!"
SYS_CONFIG=$HOME/sys_config
configs=("funcs" "evars" "alias" "zshrc" "vimrc")
for CONFIG in ${configs[@]}; do
	if [ -h "$HOME/.$CONFIG" ]; then
	    echo "Removing $CONFIG sym link"
	    rm $HOME/.$CONFIG
	fi
done
    
home_dirs=("Work" "School" "Notes" "HomeAutomation" "FileUtils")
for HOME_DIR in ${home_dirs[@]}; do
	if [ -d "$HOME/$HOME_DIR" ]; then
	    echo "Removing $HOME_DIR in $HOME"
	    rm -r $HOME/$HOME_DIR
	fi
done
