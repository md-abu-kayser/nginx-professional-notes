# Upstream Keepalive & Health Checks

```nginx
upstream backend {
    server backend1.example.com max_fails=3 fail_timeout=30s;
    keepalive 32;
}
```
