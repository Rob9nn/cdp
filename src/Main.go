package main

import (
	productController "cdp/controllers/product"

	database "cdp/dal"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	err := database.Init()
	if err != nil {
		panic(err)
	}
	router.Use(gin.Logger())

	product := router.Group("/product")
	{
		product.GET("", productController.GetAll)
	}

	router.Run()
}
