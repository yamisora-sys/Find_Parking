from opencage.geocoder import OpenCageGeocode
import pandas as pd
import mysql.connector
import requests

API_KEY = '37115a7a77524c859abcd229d39a1b5b'
geocoder = OpenCageGeocode(API_KEY)

db_connection = "mysql://localhost:3306/javaweb"

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port="3306",
    database="javaweb"
)

coordinates_db = mydb.cursor()

# Hàm lấy thông tin địa lý từ OpenCageGeoCode
def get_geocode_data(query):
    url = f'https://api.opencagedata.com/geocode/v1/json?q={query}&key={API_KEY}'
    response = requests.get(url)
    data = response.json()
    return data['results']

# Các khu vực cần lấy thông tin
areas = ['Quận 1, Thành phố Hồ Chí Minh', 'Quận 2, Thành phố Hồ Chí Minh', 'Quận 3, Thành phố Hồ Chí Minh']

for area in areas:
    coordinates_db.execute("INSERT INTO areas (name) VALUES (%s)", (area,))
    mydb.commit()
    coordinates_db.execute("SELECT LAST_INSERT_ID()")
    area_id = coordinates_db.fetchone()[0]

    geocode_data = get_geocode_data(area)

    for result in geocode_data:
        coordinates_db.execute("INSERT INTO node (latitude, longitude) VALUES (%s, %s)", (result['geometry']['lat'], result['geometry']['lng']))
        mydb.commit()
        coordinates_db.execute("SELECT LAST_INSERT_ID()")
        node_id = coordinates_db.fetchone()[0]

        coordinates_db.execute("INSERT INTO area_node (area_id, node_id) VALUES (%s, %s)", (area_id, node_id))
        mydb.commit()

coordinates_db.close()
mydb.close()

