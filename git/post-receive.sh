#!/bin/bash
while read oldrev newrev ref
do
    if [[ $ref =~ .*/master$ ]];
    then
        echo "Master ref received.  Deploying master branch to production..."
        git --work-tree=/var/www/html/ --git-dir=/var/www/.git checkout 
    elif  [[ $ref =~ .*/stage$ ]];
    then
        echo "Stage ref received.  Deploying stage branch to stage..."
        git --work-tree=/var/www/html/ --git-dir=/var/www/.git checkout stage
    else
        echo "Ref $ref successfully received.  Doing nothing: only the master branch may be deployed on this server."
    fi
done
