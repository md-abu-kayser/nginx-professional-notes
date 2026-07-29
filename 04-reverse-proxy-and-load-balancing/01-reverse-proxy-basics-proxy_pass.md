# Reverse Proxy Basics – proxy_pass

```nginx
location /api/ {
    proxy_pass http://backend_server;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```
