# Wordpress Development

This is my wordpress development environment. It uses docker (with the official
[docker image for wordpress](https://hub.docker.com/_/wordpress)).

The setup has XDEBUG enabled and ready for use with Vscode.

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

The project also contains the wordpress cli container. You may simply run
a cli commany by:

```
./wp-cli.sh <command>
```

The setup also contains a phpMyAdmin container. The frontend is accessible via http://localhost:8180.