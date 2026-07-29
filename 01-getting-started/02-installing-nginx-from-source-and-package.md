# Installing Nginx

- **Package**: `sudo apt install nginx` (Ubuntu), `sudo yum install nginx` (RHEL)
- **Source**: download, `./configure --with-http_ssl_module`, `make && make install`
- **Docker**: `docker run -d -p 80:80 nginx`

> 📘 Next: [Nginx Directory Structure](03-nginx-directory-structure.md)
