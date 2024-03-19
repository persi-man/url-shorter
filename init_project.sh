#!/bin/bash

# Define your base project directory
PROJECT_DIR="./go-url-shortener"

# Create the base directory and enter it
mkdir -p "$PROJECT_DIR" && cd "$PROJECT_DIR"

# Create directory structure
mkdir -p cmd/webserver
mkdir -p internal/shortener
mkdir -p pkg/models
mkdir -p config
mkdir -p scripts

# Create initial main.go file with a simple package declaration
echo "package main

func main() {
    // Your server's starting code will go here
}" > cmd/webserver/main.go

# Create other Go files with the appropriate package declarations
echo "package shortener

// Handler functions for URL shortening service" > internal/shortener/handler.go

echo "package shortener

// Business logic for shortening URLs" > internal/shortener/logic.go

echo "package shortener

// Data access layer, interacts with the database" > internal/shortener/storage.go

echo "package models

// Defines URL struct" > pkg/models/url.go

echo "package models

// Defines User struct" > pkg/models/user.go

echo "package config

// Configuration setup and parsing" > config/config.go

# Create an initial SQL schema file
echo "-- SQL schema for initializing the URL shortener database" > scripts/initdb.sql

# Create go.mod and go.sum files
go mod init go-url-shortener
touch go.sum

# Create a basic Dockerfile
echo "FROM golang:latest

WORKDIR /app
COPY . .

RUN go build -o ./out/go-url-shortener ./cmd/webserver

CMD [\"./out/go-url-shortener\"]" > Dockerfile

# Create a README file
echo "# Go URL Shortener

This is a URL shortener service written in Go." > README.md

# Print completion message
echo "Project structure initialized successfully!"
