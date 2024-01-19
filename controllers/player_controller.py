from flask import render_template, request, redirect, url_for
from app import app
from models import player_model as pm
from models import city_model as cm


@app.route('/players')
def player_list():
    search = request.values.get('search')
    if search:
        players = pm.search_players(search)
    else:
        players = pm.get_players()
    html = render_template(
        'player_list.jinja',
        players=players)
    return html


@app.route('/players/add', methods=['post'])
def player_add_post():
    name = request.form['name']
    date = request.form['date']
    city = request.form['city']
    pm.add_player(name, date, city)
    return redirect(url_for('player_list'))


@app.route('/players/add', methods=['get'])
def player_add_get():
    cities = cm.get_cities()
    html = render_template(
        'player_add.jinja',
        cities = cities)
    return html
