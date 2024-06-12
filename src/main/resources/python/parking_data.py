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

list_image =[
    "https://baigiuxeoto.com/wp-content/uploads/2022/04/z3317844500090_eac8d957af8bfa3af05e8962fb2ff10c.jpg",
    "https://thietbisuachuaoto.vn/wp-content/uploads/2020/06/kinh-nghiem-mo-bai-giu-xe-o-to-5.jpg",
    "https://tearu.com.vn/wp-content/uploads/2020/06/kinh-nghiem-mo-bai-giu-xe-o-to-5-1.jpg",
]

list =[]

for index, row in node_data.iterrows():
    name = fake.company()
    # col address in node_data_csv['address'] = longitute + latitude
    address = node_data_csv['address'][index]
    # price from 5000 to 3000000
    price = fake.random_int(min=5000, max=3000000)
    node_id = row['id']
    description = fake.text()
    phone = fake.phone_number()
    # per month / per day / one time
    unit_price = fake.random_element(elements=("1 lần", "1 giờ"))
    image = fake.random_element(elements=list_image)
    owner_id = fake.random_int(min=1, max=3)
    capacity = fake.random_int()
    status = fake.random_element(elements=('active', 'inactive'))
    list.append([name, address, price, node_id, description, phone, unit_price, image, owner_id, capacity, status])
# construct dataframe
parking_df = pd.DataFrame(list, columns=parking_schema)

parking_db = mydb.cursor()
parking_db.execute("USE javaweb")

for index, row in parking_df.iterrows():
    parking_db.execute("INSERT INTO parking (name, address, price, node_id, description, phone, unit_price, image, owner_id, capacity, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (row['name'], row['address'], row['price'], row['node_id'], row['description'], row['phone'], row['unit_price'], row['image'], row['owner_id'], row['capacity'], row['status']))

mydb.commit()
parking_db.close()
