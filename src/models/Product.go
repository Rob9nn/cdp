package models

type Product struct {
	Id uint `json:"id" gorm:"primaryKey"`
	Title        string   `json:"title" gorm:"not null"`
	Price        float32  `json:"price" gorm:"not null"`
	Description  string   `json:"description"`
	Ingredient   string   `json:"ingredient"`
	CategoryID 	int
}
