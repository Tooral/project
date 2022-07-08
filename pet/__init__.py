from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'lola malola'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite3'

    db.init_app(app)
    
    login_manager = LoginManager()
    login_manager.login_view = 'pet.login'
    login_manager.init_app(app)

    from .models import User

    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))
    
    from .pet import pet as pet_blueprint
    app.register_blueprint(pet_blueprint)

    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    
    return app

