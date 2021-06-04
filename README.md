OAuth configuration:

- [index](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/index.php#L59-L64)
- [callback](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/callback.php#L61-L66)

Other URL to be configured:

- [index](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/callback.php#L38)
- [User](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/index.php#L35)
- [callback](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/index.php#L38)

[Print response](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/index.php#L94-L100)

Build: `docker build --tag=php-oauth2 .`
Run: `docker run --rm --name=php-oauth2 --detach --publish=8080:80 php-oauth2`
Open: http://localhost:8080/index.php

The important parts are:

- [Install composer](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/Dockerfile#L6-L7)
- [composer.json](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/composer.json)
- [Install dependencies from composer.json](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/Dockerfile#L22-L24)
- [The main page](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/index.php)
- [The authorisation callback](https://github.com/camptocamp/geomapfish-php-oauth/blob/master/callback.php)

Dependencies:

- [php-oauth2-client](https://github.com/fkooman/php-oauth2-client)
