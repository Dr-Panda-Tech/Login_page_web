from flask import Flask
from flask_cors import CORS
from .utils.models import db
import os
from dotenv import load_dotenv

def create_app():
    app = Flask(__name__)
    CORS(app)
    
    # Environment variables
    load_dotenv("./.env")
    DB_USERNAME = os.environ.get('LOGIN_DB_USERNAME')
    DB_PASSWORD = os.environ.get('LOGIN_DB_PASSWORD')
    DB_HOST = os.environ.get('LOGIN_RDS_ENDPOINT')
    DB_NAME = os.environ.get('LOGIN_DB_NAME')

    # Database configuration
    app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}:5432/{DB_NAME}'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['JSON_AS_ASCII'] = False
    db.init_app(app)
    
    from .routes import auth_routes
    app.register_blueprint(auth_routes.bp)

    return app
