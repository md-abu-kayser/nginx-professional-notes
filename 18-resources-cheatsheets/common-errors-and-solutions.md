# Common Errors & Solutions

- `connect() failed` – upstream unreachable
- `502 Bad Gateway` – upstream error
- `413 Request Entity Too Large` – increase `client_max_body_size`
- `Permission denied` on port 80 – run with root privileges or use setcap
