# Optimizing Static File Delivery

```nginx
sendfile on;
tcp_nopush on;
gzip on;
gzip_types text/plain application/javascript;
location ~* \.(jpg|png|gif|ico)$ {
    expires 30d;
    add_header Cache-Control "public";
}
```
