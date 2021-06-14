package business

import (
	db "cdp/dal"
	model "cdp/models"
)

func Find() []model.Category{
	var categories []model.Category
	db.GetConnection().Find(&categories)
	return categories
}

func FindDrinks() []model.Category{
	var categories []model.Category
	db.GetConnection().Preload("Products").Where("type = ?", "drink").Find(&categories)
	return categories
}

func FindFoods() []model.Category{
	var categories []model.Category
	db.GetConnection().Preload("Products").Where("type = ?", "food").Find(&categories)
	return categories
}