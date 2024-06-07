import pandas as pd
import mysql.connector
from faker import Faker
import os
fake = Faker()
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port="3306",
    database="javaweb"
)

file_data = "data/node.csv"
file_path = os.path.join(os.path.dirname(__file__), file_data)

# select all node in node tabe
node_db = mydb.cursor()
node_db.execute("USE javaweb")
node_db.execute("SELECT * FROM node")
node_result = node_db.fetchall()
node_data = pd.DataFrame(node_result, columns=['id', 'latitude', 'longitude'])
node_db.close()
node_data_csv = pd.read_csv(file_path)

result = pd.merge(node_data, node_data_csv, on=['latitude', 'longitude'])

parking_schema =['name', 'address', 'price', 'node_id', 'description', 'phone', 'unit_price', 'image', 'owner_id', 'capacity', 'status']

list = []

for index, row in node_data.iterrows():
    name = fake.company()
    address = fake.address()
    # price from 5000 to 3000000
    price = fake.random_int(min=5000, max=3000000)
    node_id = row['id']
    description = fake.text()
    phone = fake.phone_number()
    # per month / per day / one time
    unit_price = fake.random_element(elements=('per month', 'per day', 'one time'))
    image = fake.image_url()
    owner_id = fake.random_int(min=1, max=3)
    capacity = fake.random_int()
    status = fake.random_element(elements=('active', 'inactive'))
    list.append([name, address, price, node_id, description, phone, unit_price, image, owner_id, capacity, status])

parking_df = pd.DataFrame(list, columns=parking_schema)

parking_db = mydb.cursor()
parking_db.execute("USE javaweb")

for index, row in parking_df.iterrows():
    parking_db.execute("INSERT INTO parking (name, address, price, node_id, description, phone, unit_price, image, owner_id, capacity, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (row['name'], row['address'], row['price'], row['node_id'], row['description'], row['phone'], row['unit_price'], row['image'], row['owner_id'], row['capacity'], row['status']))

mydb.commit()
parking_db.close()
