# Authentication

- Basic auth: `auth_basic "Restricted"; auth_basic_user_file /etc/nginx/.htpasswd;`
- JWT: Nginx Plus `auth_jwt` or using `njs`/Lua for custom validation.

> 📘 Next: [Blocking Access by IP, Geo, or User‑Agent](05-blocking-access-by-ip-geo-or-user-agent.md)
