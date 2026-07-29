# Load Balancing Methods

```nginx
upstream backend {
    least_conn;
    server backend1.example.com weight=3;
    server backend2.example.com;
    server backend3.example.com backup;
}
```
