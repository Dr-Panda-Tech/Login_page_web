from flask import Blueprint, request, jsonify
from ..utils.functions import get_user_from_db
import logging
from logging.handlers import RotatingFileHandler

bp = Blueprint('auth_routes', __name__)

# Logging configuration
handler = RotatingFileHandler('app.log', maxBytes=10000, backupCount=1)
handler.setLevel(logging.INFO)

logger = logging.getLogger(__name__)
logger.addHandler(handler)
logger.setLevel(logging.INFO)

@bp.route('/login', methods=['POST'])
def login():
    try:
        data = request.json
        username = data.get('username')
        password = data.get('password')
        user = get_user_from_db(username)

        if user and user.check_password(password):
            return jsonify({"success": True, "message": "Login successful"})
        else:
            return jsonify({"success": False, "message": "Invalid credentials"})
    
    except Exception as e:
        logger.error(f"Error during login: {str(e)}")
        return jsonify({"success": False, "message": "Server error"}), 500
