# create (and delete) a container to install symfony in the current dir
docker run --rm -v $(pwd):/app composer/composer create-project symfony/skeleton --ignore-platform-reqs
