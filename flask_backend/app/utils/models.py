import bcrypt
import os
from dotenv import load_dotenv
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
load_dotenv("./.env")

DB_TABLENAME = os.environ.get('LOGIN_DB_TABLE')

class User(db.Model):
    __tablename__ = DB_TABLENAME

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    hashed_password = db.Column(db.String(120), nullable=False)

    def set_password(self, password):
        # This will generate a new salt and hash the password
        self.hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    def check_password(self, password):
        if not self.hashed_password:
            return False
        # This will use the salt from the hashed_password and hash the input password
        # Then compare it with the stored hashed_password
        return bcrypt.checkpw(password.encode('utf-8'), self.hashed_password.encode('utf-8'))