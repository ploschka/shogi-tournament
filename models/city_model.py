from pandas import read_sql
from app import conn

def get_cities():
    return read_sql('SELECT * FROM city', conn)
