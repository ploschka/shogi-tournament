from pandas import read_sql
from app import conn


def get_tournaments():
    return read_sql('SELECT * FROM tournament', conn)


def add_tournament(name, start_date, end_date, city):
    cur = conn.cursor()
    query = f"INSERT INTO tournament (tournament_name, city_id, start_date, end_date) VALUES ('{name}', '{city}', '{start_date}', '{end_date}')"
    cur.execute(query)

def search_tournaments(q):
    return read_sql(f"SELECT * FROM tournament WHERE tournament_name LIKE '%{q}%'", conn)

def get_one(id):
    cur = conn.cursor()
    cur.execute(f"SELECT tournament_name, city_name, start_date, end_date FROM tournament NATURAL JOIN `city` WHERE tournament_id = {id}")
    return cur.fetchone()
