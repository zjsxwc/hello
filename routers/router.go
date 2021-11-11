package routers

import (
	"github.com/astaxie/beego"
	"github.com/beego/admin" //admin 包
	"hello/controllers"
)

func init() {
	admin.Run()
    beego.Router("/", &controllers.MainController{})
}
