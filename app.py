import time

from flask import Flask

app = Flask(__name__)


@app.route('/')
def home():
    time.sleep(.25)
    return 'OK'
