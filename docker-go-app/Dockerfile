# syntax=docker/dockerfile:1

########################
# 1. Build stage
########################
FROM golang:1.22-alpine AS builder

WORKDIR /app

# 1) Кэшируем зависимости
COPY go.mod ./
RUN go mod download

# 2) Копируем остальной код
COPY . .

# 3) Собираем статический бинарь
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server ./cmd/server

########################
# 2. Runtime stage
########################
FROM alpine:3.21

# Создаём non-root пользователя
RUN addgroup -S app && adduser -S -G app app

WORKDIR /app

# Копируем только бинарь из builder-стейджа
COPY --from=builder /app/server /app/server

# Порт для документации (EXPOSE не пробрасывает сам, только документация)
EXPOSE 8080

# ENV для порта приложения
ENV APP_PORT=8080

# Меняем пользователя
USER app

# HEALTHCHECK (HTTP /health)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1:${APP_PORT}/health | grep -q "ok" || exit 1

# Запуск
CMD ["/app/server"]