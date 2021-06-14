package models

type Category struct {
	Id uint `json:"id" gorm:"primaryKey"`
	Title string `gorm:"not null,unique"`
	Type string `gorm:"not null"`
	Products []Product `gorm:"foreignKey:CategoryID"`
}
