package main

import (
	categoryController "cdp/controllers/category"
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
	category := router.Group("/category")
	{
		category.GET("/drinks", categoryController.GetAllDrinks)
		category.GET("/foods", categoryController.GetAllFoods)
	}

	router.Run(":3000")
}
