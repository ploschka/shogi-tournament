from pandas import read_sql
from app import conn


def get_players():
    return read_sql('SELECT * FROM player NATURAL JOIN `rank`', conn)


def add_player(name, date, city):
    cur = conn.cursor()
    query = f"INSERT INTO player (player_name, city_id, date_of_birth) VALUES ('{name}', '{city}', '{date}')"
    print(query)
    cur.execute(query)

def search_players(q):
    return read_sql(f"SELECT * FROM player NATURAL JOIN `rank` WHERE player_name LIKE '%{q}%'", conn)
