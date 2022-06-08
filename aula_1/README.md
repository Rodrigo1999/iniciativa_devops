# iniciativa_devops

## Construção
```bash
# Inicializa o build do container
docker build -t aula_1 .
```

## Execução

```bash
# Rodando a aplicação node em localhost
docker container run -dp 8080:8080 aula_1 
```