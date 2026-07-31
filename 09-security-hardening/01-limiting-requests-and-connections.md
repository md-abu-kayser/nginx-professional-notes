# Limiting Requests & Connections

```nginx
limit_req_zone $binary_remote_addr zone=mylimit:10m rate=10r/s;
limit_req zone=mylimit burst=20;
limit_conn_zone $binary_remote_addr zone=addr:10m;
limit_conn addr 10;
```
