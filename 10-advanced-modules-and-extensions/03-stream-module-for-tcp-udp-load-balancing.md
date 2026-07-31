# Stream Module – TCP/UDP Load Balancing

```nginx
stream {
    upstream mysql_servers {
        server db1:3306;
        server db2:3306;
    }
    server {
        listen 3306;
        proxy_pass mysql_servers;
    }
}
```
