package database

import (
	"database/sql"
	"time"

	models "cdp/models"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var (
	instance *gorm.DB
)

//Db initialisation
//return Db connection or an error
func Init() error {
	sqlDb, err := sql.Open("mysql", "root:cdp@/cdp")
	if err != nil {
		return err
	}
	sqlDb.SetConnMaxLifetime(time.Minute * 3)
	sqlDb.SetMaxOpenConns(8)
	sqlDb.SetMaxIdleConns(8)

	gormDb, err := gorm.Open(mysql.New(mysql.Config{
		Conn: sqlDb,
	}), &gorm.Config{})
	if err != nil {
		return err
	}

	err = gormDb.AutoMigrate(&models.Product{}, &models.Category{})
	if err != nil {
		return err
	}

	instance = gormDb

	return nil
}

func GetConnection() *gorm.DB {
	return instance
}
