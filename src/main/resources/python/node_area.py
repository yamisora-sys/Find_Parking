import pandas as pd
import mysql.connector
import os

db_connection = "mysql://localhost:3306/javaweb"

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port="3306")

node_db = mydb.cursor()
node_db.execute("USE javaweb")
node_db.execute("""
    SELECT node.id, longitude, latitude, COUNT(parking_order.id)
    FROM node
    INNER JOIN parking ON node.id = parking.node_id
    INNER JOIN parking_order ON parking.id = parking_order.parking_id
    GROUP BY node.id
""")
node_result = node_db.fetchall()
node_data = pd.DataFrame(node_result, columns=['id', 'latitude', 'longitude', 'count'])

#show all node in node table
node_data.to_csv('data/node_area.csv', index=False)