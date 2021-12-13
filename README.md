# 42cursus - Inception

![](https://img.shields.io/badge/eval-125%25-brightgreen)

## Project Information

### About

> This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

This project is about writing customs Dockerfiles and scripts to setup a working environement with containers.

### Mandatory

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.

### Bonuses

- Set up redis cache for your WordPress website in order to properly manage the cache.
- Set up a FTP server container pointing to the volume of your WordPress website.
- Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
- Set up Adminer.
- Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.

In this case the service of my choice is a Git service on a server, a Github or Gitlab equivalent.
