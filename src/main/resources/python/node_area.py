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

file_name = 'data/node_area.csv'
file_path = os.path.join(os.path.dirname(__file__), file_name)

#convert node_data to JSON and not to save it to a file
node_data_json = node_data.to_json(orient='records')
print(node_data_json)




#show all node in node table
# node_data.to_csv(file_path, index=False)
data_json = pd.read_csv(file_path).to_json(orient='records')
# convert json to string
data_str = str(data_json)
print(data_str)