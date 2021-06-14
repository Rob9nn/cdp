package category

import (
	business "cdp/business/category"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetAll(c* gin.Context){
	categories := business.Find()
	c.JSON(http.StatusOK, gin.H{"data": categories})
}

func GetAllDrinks(c* gin.Context){
	categories := business.FindDrinks()
	c.JSON(http.StatusOK, gin.H{"data": categories})
}

func GetAllFoods(c* gin.Context){
	categories := business.FindFoods()
	c.JSON(http.StatusOK, gin.H{"data": categories})
}