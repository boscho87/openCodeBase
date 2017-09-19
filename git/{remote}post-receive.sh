# first : $ sudo apt-get install sshfs
#!/bin/bash
while read oldrev newrev ref
do
    if [[ $ref =~ .*/stage$ ]];
    then
        echo "Stage ref received.  Deploying master branch to stage..."
        temp_dir=/var/www/htdocs/temp
        dest_dir=/httpdocs/test
        rm -rf $temp_dir
        mkdir $temp_dir
        sshfs scorpions@uhc-scorpions.ch:$dest_dir $temp_dir
        git --work-tree=$temp_dir --git-dir=/var/www/git/iotcloud.itscoding.ch checkout -f
        fusermount -u $temp_dir
        rm -rf $temp_dir
    else
        echo "Ref $ref successfully received.  Doing nothing: only the stage branch may be deployed on this se$
    fi
done


