package controllers

import (
	business "cdp/business/product"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetAll(c *gin.Context) {
	products := business.Find()
	c.JSON(http.StatusOK, gin.H{"data": products})
}

func GetByCategory(c *gin.Context){
	products := business.FindByCategory(c.Param("category"))
	c.JSON(http.StatusOK, gin.H{"data": products})
}
