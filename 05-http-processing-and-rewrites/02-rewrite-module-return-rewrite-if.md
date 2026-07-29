# rewrite Module

```nginx
rewrite ^/old/(.*)$ /new/$1 permanent;
return 301 https://example.com$request_uri;
```
