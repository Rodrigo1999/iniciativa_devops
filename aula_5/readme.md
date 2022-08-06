## Instalando o helm
[helm instalation](https://helm.sh/docs/intro/install/)
## instalando o prometheus

referência de instalação: [pacote prometheus](https://artifacthub.io/packages/helm/prometheus-community/prometheus)

O comando abaixo faz o upgrade(atualiza) ou instala o prometheus.

`prometheus-community/prometheus` é como se fosse o repositório

nesse comando eu consigo setar (--set) o que eu quero que venha com a instalação.

Para rodar esse comando é necessário que o meu cluster kubernete esteja rodando,
nesse caso de exemplo dessa aula, recomendo utilizar o cluster da digital ocean. O prometheus irá se integrar com o cluster que o kubernete está utilizando.

```bash
helm upgrade --install prometheus prometheus-community/prometheus --set alertmanager.enabled=false,server.persistentVolume.enabled=false,server.service.type=LoadBalancer,server.global.scrape_interval=10s,pushgateway.enabled=false
```

## instalando o grafana
referência de instalação: [pacote grafana](https://artifacthub.io/packages/helm/grafana/grafana)

### instalação

```bash
helm upgrade --install grafana grafana/grafana --set service.type=LoadBalancer
```

Após a instalação, o grafana lhe dará instrução no terminal de como pegar a senha do usuário admin:

```bash
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
> exemplo do resultado do comando acima: lwIGIpZ52lnyHUtszLiUI54SO65xVaPxQM3hwY7G

### Dashboard do grafana

O grafana disponibiliza vários dashboards dentro dele, caso eu queira utilizar um dasboard de métricas já construído pela comunidade, eu posso buscar no site oficial do grafana, segue um exemplo de um dashboard pronto para nodejs:
> https://grafana.com/grafana/dashboards/11159