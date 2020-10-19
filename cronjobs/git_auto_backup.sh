#!/bin/sh
PATH=/Users/etrapp/sys_config/macos/home_dir/envs/py3_base/bin:/usr/local/bin:/usr/bin:/Users/etrapp/bin:/Users/etrapp/anaconda3/bin:/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/etrapp/anaconda3/envs/py3/bin:/Users/etrapp/anaconda3/condabin:/home/trapp/anaconda3/bin:/Users/etrapp/bin:/Users/etrapp/anaconda3/bin:/bin/

#TODO: Use projects array

# Add changes to git
cd /Users/etrapp/sys_config && /usr/local/bin/git add . && /usr/local/bin/git commit -a -m "auto crontab backup `date`"
# Push to remote
cd /Users/etrapp/sys_config && /usr/local/bin/git push origin master

# Add changes to git
cd $dom && /usr/local/bin/git add . && /usr/local/bin/git commit -a -m "auto crontab backup `date`"
# Push to remote
cd $dom && /usr/local/bin/git push origin master

# Add changes to git
cd $stor && /usr/local/bin/git add . && /usr/local/bin/git commit -a -m "auto crontab backup `date`"
# Push to remote
cd $stor && /usr/local/bin/git push origin master

# Add changes to git
cd $ship && /usr/local/bin/git add . && /usr/local/bin/git commit -a -m "auto crontab backup `date`"
# Push to remote
cd $ship && /usr/local/bin/git push origin master
