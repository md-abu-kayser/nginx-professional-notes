# Ingress Rules & SSL

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp
spec:
  tls:
    - hosts: [example.com]
      secretName: tls-secret
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            backend:
              service:
                name: web
                port:
                  number: 80
```
