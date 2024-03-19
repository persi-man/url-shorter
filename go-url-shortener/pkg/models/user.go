package models

import (
    "github.com/synbioz/go_api/config"
    "log"
    "time"
)

type URL struct {
    ID          int       `json:"id"`
    LongURL     string    `json:"long_url"`
    ShortCode   string    `json:"short_code"`
    CreatedAt   time.Time `json:"created_at"`
    ExpiresAt   time.Time `json:"expires_at"`
    ClickCount  int       `json:"click_count"`
}

func CreateURL(url *URL) error {
    url.CreatedAt = time.Now()

    _, err := config.Db().Exec("INSERT INTO urls (long_url, short_code, created_at, expires_at, click_count) VALUES (?, ?, ?, ?, ?);",
        url.LongURL, url.ShortCode, url.CreatedAt, url.ExpiresAt, url.ClickCount)

    if err != nil {
        log.Fatal(err)
        return err
    }

    return nil
}

func FindURLByShortCode(shortCode string) (*URL, error) {
    var url URL

    row := config.Db().QueryRow("SELECT * FROM urls WHERE short_code = ?;", shortCode)
    err := row.Scan(&url.ID, &url.LongURL, &url.ShortCode, &url.CreatedAt, &url.ExpiresAt, &url.ClickCount)

    if err != nil {
        log.Fatal(err)
        return nil, err
    }

    return &url, nil
}

// Defines User struct
