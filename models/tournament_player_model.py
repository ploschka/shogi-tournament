from pandas import read_sql
from app import conn


def get_players(id):
    return read_sql(f"""
                    SELECT * FROM tournament_player
                    NATURAL JOIN player
                    NATURAL JOIN tournament
                    WHERE tournament_id = {id}
                    """, conn)


def get_winner_number(id):
    cur = conn.cursor()
    cur.execute(f"""
                SELECT table_number FROM tournament_player
                WHERE tournament_player_id = {id}
                """)
    return cur.fetchone()[0]
