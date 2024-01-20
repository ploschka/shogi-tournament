from pandas import read_sql
from app import conn


def get_games(t_id, p_id):
    return read_sql(f"""
                    SELECT * FROM tournament
                    NATURAL JOIN tour
                    NATURAL JOIN game
                    WHERE
                    tournament_id = {t_id} AND
                    (player1_id = {p_id} OR player2_id = {p_id})
                    ORDER BY number ASC
                    """, conn)
