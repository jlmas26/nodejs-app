# nodejs-app - Aplicação teste usando node e containers

A aplicação é uma API implementada com Node.js​ + MySQL​. É uma API para criação e
consulta de anotações.

Antes de subir a aplicação é necessário fazer o build dos containers do docker para a aplicação node e o proxy reverso rodando
no NGINX

O Dockerfile do container node está na raiz do repositorio e o do proxy esta na pasta proxy junto ao arquivo de configuração do
NGINX.

Executar os seguintes comandos a partir da raiz:
```
docker build -t "nodejs-app:1.0" .

docker build -t "reverseproxy:1.0" proxy/.

```

Finalizado o build dos containers, executar **docker-compose** para subir o ambiente da aplicação

```
docker-compose -f docke-compose.yaml up -d

```
Execute "docker ps -a" para confirmar se os containers subiram corretamente.

As permissões necessárias no banco MySQL estão no script **database_schema.sql**. Para conectar ao banco execute:
```
docker exec -it nodejsapp_mysql_1 mysql -uroot -p
```
OBS: nodejapp_mysql_1 é o nome padrão do container. Mude caso tenha definido no seu docker-compose com outro nome

Tendo executado com sucesso todos os procedimentos, execute no seu terminal os comandos abaixo para validar a aplicação:
```
# Para consultar a aplicação
curl -X GET http://localhost/notes

# Para adicionar uma nota
curl -H "Content-Type: application/json" -X POST -d '{"nota1":"teste"}' http://localhost/notes

# Para remover uma nota, consulte antes o id com o primeiro comando e depois execute. Deverar retornar 'OK'
curl -X DELETE http://localhost/notes/<id_da_nota>




