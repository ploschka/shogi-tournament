from flask import render_template, jsonify, request, redirect, url_for
from app import app
from models import tournament_model as tm
from models import city_model as cm
import datetime as dt
import locale


@app.route('/tournaments')
def tournament_list():
    search = request.values.get('search')
    if search:
        tournaments = tm.search_tournaments(search)
    else:
        tournaments = tm.get_tournaments()
    html = render_template(
        'tournament_list.jinja',
        tournaments=tournaments)
    return html


@app.route('/tournament/<int:tournament>')
def tournament_page(tournament):
    t = tm.get_one(tournament)
    html = render_template(
        'tournament_page.jinja',
        name=t[0],
        city=t[1],
        start_date=t[2].strftime('%d %B %Y'),
        end_date=t[3].strftime('%d %B %Y')
    )
    return html


@app.route('/tournaments/add', methods=['post'])
def tournament_add_post():
    name = request.form['name']
    start_date = request.form['start_date']
    end_date = request.form['end_date']
    city = request.form['city']
    tm.add_tournament(name, start_date, end_date, city)
    return redirect(url_for('tournament_list'))


@app.route('/tournaments/add', methods=['get'])
def tournament_add_get():
    cities = cm.get_cities()
    html = render_template(
        'tournament_add.jinja',
        cities=cities)
    return html
