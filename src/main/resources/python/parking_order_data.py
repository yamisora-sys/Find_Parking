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

def generate_fake_data(num_records):
    data = []
    for _ in range(num_records):
        in_time = fake.date_time_between(start_date='-1y', end_date='now')
        out_time = fake.date_time_between(start_date=in_time, end_date='now')
        payment_amount = fake.random_number(digits=5)
        payment_method = fake.random_element(elements=('Credit Card', 'Cash', 'PayPal'))
        payment_status = fake.random_element(elements=('Paid', 'Unpaid'))
        status = fake.random_element(elements=('Active', 'Inactive'))
        total = fake.random_number(digits=5)
        parking_id = fake.random_int(min=1, max=10)  
        user_id = fake.random_int(min=1, max=2)
        
        data.append((in_time, out_time, payment_amount, payment_method, payment_status, status, total, parking_id, user_id))
    
    return data

def insert_data_to_mysql(data):
    cursor = mydb.cursor()
    sql = "INSERT INTO parking_order (in_time, out_time, payment_amount, payment_method, payment_status, status, total, parking_id, user_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
    cursor.executemany(sql, data)
    mydb.commit()
    print(cursor.rowcount, "record(s) inserted.")

# Generate 100 fake records
fake_data = generate_fake_data(100)

# Insert fake data into MySQL
insert_data_to_mysql(fake_data)
