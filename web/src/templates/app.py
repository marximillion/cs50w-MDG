import datetime

from flask import Flask, render_template, request
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))
app = Flask(__name__)


@app.route("/")
def index():
    now = datetime.datetime.now()
    new_year = now.month == 1 and now.day == 1
    return render_template("index.html", new_year=new_year, now=now)


@app.route("/names")
def names():
    names = ["Alice", "Bob", "Combucha", "Donday"]
    return render_template("names.html", names=names)


@app.route("/bye")
def bye():
    headline = "Goodbye world!"
    return render_template("index.html", headline=headline)


@app.route("/hello", methods=["POST"])
def hello():
    name = request.form.get("name")
    return render_template("hello.html", name=name)


""" @app.route("/<string:name>")
def hello(name):
    name = name.upper()
    return f"Hello, {name}!" """
