from .models import User

def get_user_from_db(username):
    try:
        return User.query.filter_by(username=username).first()
    except Exception as e:
        print(f"Error retrieving user from database: {str(e)}")
        return None