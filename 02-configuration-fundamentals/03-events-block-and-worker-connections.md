# Events Block & Worker Connections

```nginx
events {
    worker_connections 1024;
    use epoll;
    multi_accept on;
}
```
