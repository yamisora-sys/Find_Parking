import pandas as pd
import mysql.connector
import os

db_connection = "mysql://localhost:3306/javaweb"

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port="3306")

file_data = "data/node.csv"
file_path = os.path.join(os.path.dirname(__file__), file_data)
node_data =  pd.read_csv(file_path)
# convert cordinate to float
node_data['latitude'] = node_data["latitude"].astype(float)
node_data['longitude'] = node_data['longitude'].astype(float)

node_db = mydb.cursor()
node_db.execute("USE javaweb")

for index, row in node_data.iterrows():
    node_db.execute("INSERT INTO node (latitude, longitude) VALUES (%s, %s)", (row['latitude'], row['longitude']))

mydb.commit()
node_db.close()