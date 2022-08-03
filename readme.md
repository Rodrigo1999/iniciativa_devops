## Criar um cluster simples com k3d:
```bash
k3d cluster create mycluster --servers 2 --agents 2 -p "30000:30000@loadbalancer"
```