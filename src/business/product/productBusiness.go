package business

import (
	db "cdp/dal"

	model "cdp/models"
)

func Find() []model.Product{
	var products []model.Product
	db.GetConnection().Find(&products)
	return products
}
