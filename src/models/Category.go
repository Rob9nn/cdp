package models

import "gorm.io/gorm"

type Category struct {
	gorm.Model
	Title string `gorm:"not null,unique"`
}
