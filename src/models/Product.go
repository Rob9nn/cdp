package models

import (
	"gorm.io/gorm"
)

type Product struct {
	gorm.Model
	Title        string   `json:"title" gorm:"not null"`
	Price        float32  `json:"price" gorm:"not null"`
	Description  string   `json:"description"`
	Ingredient   string   `json:"ingredient"`
	CategoryName string   `json:"categoryName" sql:"type:varchar references categories(name)"`
	Category     Category `gorm:"ForeignKey:CategoryName;AssociationForeignKey:Name"`
}
