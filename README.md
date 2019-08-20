# Alpine PHP Docker Images

This repository provides docker images for php versions `7.0+` in the both (separated) `CLI` and `FPM` variants with and without `xdebug` installed.
The basic image is `alpine` and always will be, therefore the `-alpine` suffix is not present.

| Flavour | CLI | PHP-FPM |
| --- | --- | --- |
| `vanilla` | `musurp/php:x-cli` | `musurp/php:x-fpm` |
| `xdebug` | `musurp/php-dev:x-cli` | `musurp/php-dev:x-fpm` |
| `supervisor` | `musurp/php(-dev):x-cli-supervisor` | `n/a` |

The following versions are available:

* `7.0` (currently targeting `7.0.33`) (`final`)
* `7.1` (currently targeting `7.1.31`)
* `7.2` (currently targeting `7.2.21`)
* `7.3` (currently targeting `7.3.8`)

Alternatively for more refined version management (this is recommended) the images mentioned above have been tagged with the patch version also.
For example `musurp/php:7.1.31-cli` and `musurp/php-dev:7.2.21-fpm`.

* https://hub.docker.com/r/musurp/php/
* https://hub.docker.com/r/musurp/php-dev/

### Compiled Libraries

The images are all compiled with (where possible and required) the following libraries.

* `opcache`
* `xml`
* `zip`
* `intl`
* `bcmath`
* `mcrypt` (`<= 7.1`, `>` replaced with `openssl`)
* `pdo`
* `pgsql`
* `sockets` (`>= 7.3.2, 7.2.15, 7.1.26, 7.0.33`)

### Sizes

Image sizes are typically between `70mb` and `80mb` compressed.
Uncompressed the images sit at roughly double the size, last checked at `146mb`.
As of `7.3` images are looking around `160mb` uncompressed.

### Additional Commands

All images will also come with a few really basic commands pre-installed for developer convenience.

* `curl`
* `make`
* `git`
* `tree`
* `openssl-client`

### Supervisor

The `cli` tagged images also have a variation that includes `supervisor` to assist with worker implementations.
Obviously because of this the container will be larger and includes dependencies such as `python@2.7` and various bundling packages.

```sh
$ docker run musurp/php:7.3.8-cli-supervisor
```

The above will start a container with `supervisord` running in no daemon mode as its `--entrypoint`.
By default it does not have a configuration file defined (or might read a default) so it is recommend that you specific a configuration file manually.
This can be done by specifying additional arguments at runtime.

```sh
$ docker run musurp/php:7.3.8-cli-supervisor --configuration /srv/path/conf.conf
```

In `docker-compose` it would look like this:

```yaml
services:
  worker:
    image: musurp/php:7.3.8-cli-supervisor
    command: --configuration /srv/path/conf.conf
```

I recommend having a separate supervisor specific image in your `docker-compose.yml` file for your workers.
This means you can leave the workers running and manually restart the container when code changes are made.
Just for clarification `docker-compose restart worker` can restart the container in isolation.
