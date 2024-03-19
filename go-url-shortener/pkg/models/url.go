package models

import (
    "github.com/synbioz/go_api/config"
    "log"
    "time"
)

type User struct {
    ID           int       `json:"id"`
    Username     string    `json:"username"`
    PasswordHash string    `json:"-"`
    CreatedAt    time.Time `json:"created_at"`
}

func CreateUser(user *User) error {
    user.CreatedAt = time.Now()

    _, err := config.Db().Exec("INSERT INTO users (username, password_hash, created_at) VALUES (?, ?, ?);",
        user.Username, user.PasswordHash, user.CreatedAt)

    if err != nil {
        log.Fatal(err)
        return err
    }

    return nil
}

func FindUserByUsername(username string) (*User, error) {
    var user User

    row := config.Db().QueryRow("SELECT * FROM users WHERE username = ?;", username)
    err := row.Scan(&user.ID, &user.Username, &user.PasswordHash, &user.CreatedAt)

    if err != nil {
        log.Fatal(err)
        return nil, err
    }

    return &user, nil
}

// Defines URL struct
