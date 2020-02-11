package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Hello")
	})

	// Listen and Server in 0.0.0.0:80
	r.Run(":80")
}
