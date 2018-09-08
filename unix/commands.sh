
# replace http:// with https://
egrep -lRZ 'http://' test.sql | xargs -0 -l sed -i -e 's$http://$https://$g'



# rasberry pi usb on/off
# OFF
echo '1-1' |sudo tee -a /sys/bus/usb/drivers/usb/unbind
# ON
echo '1-1' |sudo tee -a /sys/bus/usb/drivers/usb/bind
