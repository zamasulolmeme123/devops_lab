## Docker go

- Простейшее HTTP‑приложение на Go, завернутое в Docker с multi‑stage сборкой, non‑root пользователем и healthcheck.


- Собрать образ:
```
    docker build -t docker-go-app:dev .
```

- Запустить контейнер:

```
    docker run --rm -p 8080:8080 docker-go-app:dev
```

- Проверить в браузере или curl:

```
    curl http://localhost:8080/
    curl http://localhost:8080/health
```

- Запуск через docker compose:

```
    docker compose up --build
```

# Приложение:

http://localhost:8080/ — основной эндпоинт
http://localhost:8080/health — healthcheck
Postgres поднимется как отдельный сервис postgres (для дальнейшего подключения из приложения).