# Serving Static Files – root vs alias

```nginx
location / {
    root /var/www/html;
}
location /images/ {
    alias /var/www/images/;
}
```
