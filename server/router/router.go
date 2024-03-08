package router

import (
	"server/internal/user"
	"server/ws"

	"github.com/gin-gonic/gin"
)

var r *gin.Engine

func Initrouter(userHandler *user.Handler, wsHandler *ws.Handler) {
	r = gin.Default()

	r.POST("/signup", userHandler.CreateUser)
	r.POST("/login", userHandler.Login)
	r.GET("/logout", userHandler.Logout)

	r.POST("/ws/createRoom", wsHandler.CreateRoom)

}

func Start(addr string) error {
	return r.Run(addr)
}
