
# replace http:// with https://
egrep -lRZ 'http://' test.sql | xargs -0 -l sed -i -e 's$http://$https://$g'
