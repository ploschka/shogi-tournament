from pandas import read_sql
from app import conn


def get_tours(id):
    return read_sql(f"""
                    SELECT * FROM tour
                    NATURAL JOIN tournament
                    WHERE tournament_id = {id}
                    ORDER BY number ASC
                    """, conn)

