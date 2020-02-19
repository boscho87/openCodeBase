# Composer
### create (and delete) a container to install symfony in the current dir
`docker run --rm -v $(pwd):/app composer/composer create-project symfony/skeleton --ignore-platform-reqs`

# Databse
### Backup
`docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql`

### Restore
`cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE`


### Build in Context
`docker build --tag shop:test --file=_docker/php-fpm/Dockerfile .`
