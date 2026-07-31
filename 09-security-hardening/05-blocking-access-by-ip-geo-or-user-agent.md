# Blocking Access

`deny 192.168.1.1; allow 10.0.0.0/8;` `if ($http_user_agent ~* "BadBot") { return 403; }`

> 📘 Next: [Preventing DDoS & Slowloris Attacks](06-preventing-ddos-and-slowloris-attacks.md)
