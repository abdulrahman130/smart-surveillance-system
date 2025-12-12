.PHONY: help up down build logs clean

help:
    @echo "Available commands:"
    @echo "  make up     - Start all services"
    @echo "  make down   - Stop all services"
    @echo "  make build  - Rebuild all services"
    @echo "  make logs   - Show logs from all services"
    @echo "  make clean  - Clean up temporary files"

up:
    docker-compose up -d

down:
    docker-compose down

build:
    docker-compose build --no-cache

logs:
    docker-compose logs -f

clean:
    @echo "Cleaning up..."
    rmdir /s /q __pycache__ 2>nul || true
    del /s /q *.pyc 2>nul || true
    docker-compose down -v
