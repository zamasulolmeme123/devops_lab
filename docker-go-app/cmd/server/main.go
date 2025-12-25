package main

import (
	"log"
	"net/http"
	"os"

	"docker-go-app/internal/handler"
)

func main() {
	port := getEnv("APP_PORT", "8080")

	mux := http.NewServeMux()
	mux.HandleFunc("/health", handler.Health)
	mux.HandleFunc("/", handler.Root)

	addr := ":" + port
	log.Printf("starting server on %s", addr)

	if err := http.ListenAndServe(addr, mux); err != nil {
		log.Fatalf("server error: %v", err)
	}
}

func getEnv(key, def string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return def
}
