import mysql.connector
from flask import Flask
from dotenv import load_dotenv
import os
import locale
load_dotenv()
locale.setlocale(locale.LC_ALL, ('ru_RU', 'UTF-8'))

conn = mysql.connector.connect(user=os.getenv('MYSQL_DATABASE_USER'),
                               password=os.getenv('MYSQL_DATABASE_PASSWORD'),
                               host=os.getenv('MYSQL_DATABASE_HOST'),
                               database=os.getenv('MYSQL_DATABASE_DB'))
conn.autocommit = True

app = Flask(__name__)

import controllers
