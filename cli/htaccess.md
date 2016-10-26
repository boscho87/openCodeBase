
### Create htpasswd file 
```htpasswd -c /var/www/domain.com/public_html/.htpasswd user1```

### Add a user /  update password
```htpasswd /var/www/domain.com/public_html/.htpasswd user2```


### the .htaccess file can include the .htpassed file
```
AuthName "Restricted Area"
AuthType Basic
AuthUserFile /var/www/domain.com/htdocs/.mycustompasswordfile
AuthGroupFile /dev/null
require valid-user
```
