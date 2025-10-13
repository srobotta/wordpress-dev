#!/bin/bash

docker run -it --rm \
	--volumes-from wordpress \
	--network container:wordpress \
	-e WORDPRESS_DB_USER=root \
	-e WORDPRESS_DB_PASSWORD=foobar \
	-e WORDPRESS_DB_NAME=wordpress \
        -e WORDPRESS_TABLE_PREFIX=wp2f_ \
        -e PHP_MEMORY_LIMIT=512M \
	wordpress:cli php -d memory_limit=512M /usr/local/bin/wp $@