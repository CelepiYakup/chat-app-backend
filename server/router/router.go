package router

import (
	"server/internal/user"

	"github.com/gin-gonic/gin"
)

var a *gin.Engine

func Initrouter(userHandler *user.Handler) {
	a = gin.Default()

	a.POST("/signup", userHandler.CreateUser)

}

func Start(addr string) error {
	return a.Run(addr)
}
