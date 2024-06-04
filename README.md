# Iniciando o sistema `desconto inss`

Este arquivo README fornece instruções sobre como rodar o sistema Desconto INSS localmente.

## Pré-requisitos

Certifique-se de ter o Docker, Docker-compose, instalado na sua máquina.

## Arquivo `.env`

Arquivo `.env` proposto:

```
DATABASE_NAME=inssapp
DATABASE_USER=inssapp
DATABASE_PASSWORD=inssapp
DATABASE_HOST=database
DATABASE_PORT=5432
RAILS_ENV=development
NODE_ENV=development
RAILS_ENV=development
POSTGRES_USER=inssapp
POSTGRES_PASSWORD=inssapp
REDIS_HOST=redis
```

## Iniciando o Contêiner Docker

Execute o seguinte comando no terminal para iniciar o contêiner Docker:

```
docker-compose up
```

Criando as dependências de banco de dados e dados iniciais:

```
docker-compose exec app rake db:create
docker-compose exec app rake db:migrate
docker-compose exec app rake db:seed
```

## Dados iniciais e Login default criado no seed

Agora você já pode acessar a tela do sistema acessando no seu navegador:

```
localhost:3000
```

Login e senha criados no `seed`:

```
	{
		email: 'desafio@exemplo.com',
		password: 'DesafioDojo'
	}
```
