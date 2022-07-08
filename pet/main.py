from flask import Blueprint, render_template 
from flask_login import login_required, current_user

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/myaccount')
@login_required
def myaccount():
    return render_template('myaccount.html')