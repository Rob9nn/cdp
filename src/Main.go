package main

import (
	categoryController "cdp/controllers/category"
	productController "cdp/controllers/product"
	database "cdp/dal"
	"cdp/middleware"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	err := database.Init()
	if err != nil {
		panic(err)
	}
	router.Use(middleware.CorsMiddleware())
	router.Use(gin.Logger())
	product := router.Group("/product")
	{
		product.GET("", productController.GetAll)
		product.GET("/:category", productController.GetByCategory)
	}

	category := router.Group("/category")
	{
		category.GET("", categoryController.GetAll)
		category.GET("/drinks", categoryController.GetAllDrinks)
		category.GET("/foods", categoryController.GetAllFoods)
	}

	router.Run()
}
