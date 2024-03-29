setup:
	$ make install-air
.PHONY: setup

run:
	$ go build -o ./tmp/backend-cockfighting-2024-q1 cmd/api/main.go && TZ=UTC APP_ENV=development PORT=9988 DATABASE_URL=postgres://postgres:fight@127.0.0.1:5458/fight ./tmp/backend-cockfighting-2024-q1
.PHONY: run

dev:
	$ air -c .air.toml
.PHONY: dev

start-compose-services:
	$ docker compose up -d --build
PHONY: start-database

stop-compose-services:
	$ docker compose down
PHONY: stop-compose-services

start-dev-compose-services:
	$ docker compose -f docker-compose.dev.yml up -d
PHONY: start-database

stop-dev-compose-services:
	$ docker compose -f docker-compose.dev.yml down
	$ docker volume rm golang-pgx_postgres_data
PHONY: stop-compose-services

build-image:
	$ docker build --no-cache -t lucaswilliameufrasio/backend-cockfighting-q1-2024-api --progress=plain -f ./Dockerfile .
PHONY: build-image

push-image:
	$ docker push lucaswilliameufrasio/backend-cockfighting-q1-2024-api
PHONY: push-image

install-air:
	$ go install github.com/cosmtrek/air@latest
	$ asdf reshim golang
.PHONY: install-air
