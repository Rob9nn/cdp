import mysql.connector
import csv
from datetime import datetime
from mysql.connector import Error

ADD_CATEGORY = ("""
    INSERT INTO categories (title, type) 
    VALUES (%s, %s)  
""")

ADD_PRODUCT_DRINK = ("""
    INSERT INTO products (title, price, category_id) 
    VALUES (%s, %s, %s)
""")

ADD_PRODUCT_FOOD = ("""
    INSERT INTO products (title, price, description, ingredient, category_id) 
    VALUES (%s, %s, %s, %s ,%s)
""")


def import_data(cursor):
    with open('drink.csv', encoding='utf16') as file:
        reader = csv.reader(file, delimiter=",")
        current_category_id = -1
        for row in reader:
            if row[1] == '':
                cursor.execute(ADD_CATEGORY, (row[0], "drink"))
                current_category_id = cursor.lastrowid
            else:
                cursor.execute(ADD_PRODUCT_DRINK, (row[0], float(row[1]), current_category_id))

    with open('food.csv', encoding='utf16') as file:
        reader = csv.reader(file, delimiter=",")
        current_category_id = -1
        for row in reader:
            if row[1] == '':
                cursor.execute(ADD_CATEGORY, (row[0], "food"))
                current_category_id = cursor.lastrowid
            else:
                if(row[2] == ''):
                    cursor.execute(ADD_PRODUCT_FOOD, (row[0], float(row[1]), 'NULL', row[3], current_category_id))
                else:
                    cursor.execute(ADD_PRODUCT_FOOD, (row[0], float(row[1]), row[2], row[3], current_category_id))


try:
    connection = mysql.connector.connect(
        host='127.0.0.1',
        database='cdp',
        user='root',
        password='cdp'
    )
    if connection.is_connected():
        cursor = connection.cursor()
        import_data(cursor)
        connection.commit()
except Error as e:
    if connection.is_connected():
        connection.rollback()
    print("An error occured : ", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Connection has been closed")