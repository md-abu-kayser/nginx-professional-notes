# proxy_cache & fastcgi_cache

```nginx
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=1g inactive=60m;
proxy_cache my_cache;
proxy_cache_key "$scheme$request_method$host$request_uri";
```
