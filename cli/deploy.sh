# sudo apt-get install sshfs
mkdir ~/tmp
sshfs user@server:/  ~/tmp
# rsync or git checkout etc....
rsync -av --delete --no-copy-links ~/net/remote-server/remote/path/ /local/path/
#git checkout
fusermount -u ~/tmp
rm -r ~/tmp

##working example:
temp_dir=/var/www/htdocs/temp
origin_dir=/var/www/htdocs/da_webclient_python/
dest_dir=/httpdocs/test/
rm -rf $temp_dir
mkdir $temp_dir
sshfs scorpions@uhc-scorpions.ch:$dest_dir $temp_dir
rsync -av --delete $origin_dir $temp_dir
fusermount -u $temp_dir
rm -rf $temp_dir
