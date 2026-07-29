# Configuring SSL Certificates

```nginx
server {
    listen 443 ssl;
    ssl_certificate /etc/ssl/certs/example.com.pem;
    ssl_certificate_key /etc/ssl/private/example.com.key;
}
```
