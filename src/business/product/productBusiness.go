package business

import (
	db "cdp/dal"

	model "cdp/models"
)

func Find() []model.Product{
	var products []model.Product
	db.GetConnection().Joins("Category").Find(&products)
	return products
}

func FindByCategory(category string) []model.Product{
	var products []model.Product
	db.GetConnection().Where("category_id = ?", category).Find(&products)
	return products
}