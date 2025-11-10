# Wordpress Development

This is my wordpress development environment. It uses docker (with the official
[docker image for wordpress](https://hub.docker.com/_/wordpress)).

The setup has XDEBUG enabled and ready for use with Vscode.

## Setup installation

The database has some fixed credentials is use. Your wordpress config file therefore must use the following
settings:

```
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'foobar' );

/** MySQL hostname */
define( 'DB_HOST', 'db' );

[...]

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp2f_';
```

The whole wordpress installation must reside in the `wordpress` folder (therefore it's there but empty).

Once installed, your wordpress installation is available at http://localhost:8080

## Wordpress CLI

The project also contains the wordpress cli container. You may simply run
a cli command by:

```
./wp-cli.sh <command>
```

## Database

The setup also contains a phpMyAdmin container. The frontend is accessible via http://localhost:8180.

To import a database dump from the host machine, the dump needs to be copied into the
database container and then the mariadb cli must be executed to import the dump.

```
docker cp db-dump.sql mariadb:.
docker exec -it db bash -c 'mariadb -u root -p -c wordpress < db-dump.sql'
```

After the dump is imported, log into the DB via:

```
docker exec -it db bash -c 'mariadb -u root -p -c wordpress'
```

and execute the following statement:

```
update wp2f_options set option_value = "http://localhost:8080" where option_name in ("siteurl", "home");
```

With Ctrl+D you leave the DB.

**Note**: links on the website may still lead to the official domain name and not localhost. There are
a log more settings where the domain is stored in, but these are serialized objects or arrays where
a simple search and replace operation in the database would break the setting.
In these cases adjust the address line in the browser and reload the page to be on the development
installation in docker.
