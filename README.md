# Custom Image

## Introduction

This is my custom image configuration. I like using Debian to build projects because it is simple to use and has extensive documentation. I built this image using a slim version of Debian to make it accessible to anyone who wants to try creating their Proof of Concept (PoC). This custom image provides some commands and folders to build and run easily.

### Building the Image

To build the image, you can run this command:

```
make build
```

**NOTE:** If you don't have the `make` command installed, run the following command:

```
./install.sh
```

This script will install the `make` package for you.

### Running the Container

To run the container, use:

```
make run
```

This command will run your Debian container in the background and return the container ID.

## Ports

In this section, I will notify you which ports are open for use by the server.

- **Redis server:** By default, the port is 6379. This service is not running by default. To check its status, use the following command:

  ```
  service redis-server status
  ```

- **MariaDB server:** By default, the port is 3306. This service is not running by default. To check its status, use the following command:
  ```
  service mariadb status
  ```

**NOTE:** For more information, here is [the official documentation for developers](https://redis.io/docs/latest/develop/).
