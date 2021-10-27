# Exemplo de utilização

Estrutura de arquvios
---

App
|--.gitignore
|--Dockerfile
|--NetCore.Docker.csproj
|--Program.cs
|--bin
|--obj

Processando o arquivo _Dockerfile_
---
Esse comando processa cada linha do arquivo _Dockerfile_. Cria uma imagem e cria um repostório local chamado **counter-image**.
```
docker build -t counter-image:1.0 -f Dockerfile .
```

`docker build` processa o arquivo _Dockerfile_.
`-f Dockerfile .` institui o docker a usar a pasta atual para encontrar o _Dockerfile_.
`-t counter-image:1.0`  nome da imagem que será criada.

Visualizando as imagens
---
Esse comando exibe uma lista das imagens instaladas.
```
docker images
```

| REPOSITORY | TAG | IMAGE ID | CREATED | SIZE |
| ---------- | :-: | :------: | :-----: | :--: |
| counter-image | 1.0 | a9ef5de0750f | 20 seconds ago | 208MB |
| mcr.microsoft.com/dotnet/aspnet | 3.1 | a9ef5de0750f |  20 seconds ago | 208MB |

Observe que as duas imagens compartilham o mesmo valor de **ID DA IMAGEM**. O valor é o mesmo entre as duas imagens porque o único comando no _Dockerfile_ era basear a nova imagem em uma imagem existente.


Criando um contêiner
---
Agora quê já têm uma imagem, será criado um contêiner. Existe 2 mainera de criá-lo.

```
docker create --name core-counter counter-image
```
`docker create` cria um contêiner com base na imagem `counter-image`. A saída desse comando mostra o **ID DO CONTTÊINER**.
`41ed382bb203b0ba41ad3c594cc88376886edee5b2c2a7b5592507b2c5d3b116`


Listando os contêineres
---
Exibe uma lista de _todos_ contêineres.
`docker ps -a`

Será exibido uma tabela
| CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES |
| ------------ | :---: | :---: | :---: | :---: | :---: | :---: |
| 41ed382bb203 | counter-image:1.0 | "dotnet NetCore.Dock…" | 57 seconds ago | Created |  | core-counter |

Gerenciar o contâiner
---
Foi criado um contêiner com o nome `core-counter`, esse nome é utilizado para genciar o contêiner.

Iniciando o contêiner
---
A saída desse comando é o nome do contêiner 
```
docker start core-counter
core-counter
```

O comando abaixo lista os contêineres em execução
`
docker ps -a
`

| CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES | 
| ------------ | :---: | :-----: | :------: | :---: | :---: | :---: | 
| 41ed382bb203 | counter-image:1.0 | "dotnet NetCore.Dock…" | 46 minutes ago | Up 8 seconds |  | core-counter |


Parando o contêiner
---
A saída desse comando é o nome do contêiner
```
docker stop core-counter
core-counter
```

Conectar-se a um contêiner
---
Depois do contaêiner em execução, o comando abaixo pode conectar-se a ele e ver sua execução.

```
docker attach --sig-proxy=false core-counter
```
A tecla `CTRL+c`, é usada para desconectar do contêiner em execução.
`--sig-proxy=false` garante que o `CTRL+c`, não imperromperá o processo no contêiner.

```
docker attach --sig-proxy=false core-counter
Counter: 1
Counter: 2
Counter: 3
^C

docker attach --sig-proxy=false core-counter
Counter: 9
Counter: 10
Counter: 11
^C
```

Excluíndo um contêiner
---
O comando abaixo exluí um contêiner.
`docker rm core-counter`

Execução única
---
O comando `docker run`, cria e executa o contêiner com um único comando. Também é possível definir o parâmetro `--rm`, para excluir automaticamente o contêiner depois que ele for interompido.

```
docker run -it --rm counter-image:1.0
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
Counter: 6
^C
```

