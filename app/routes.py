from app import app

@app.route('/')
@app.route('/index')
def index():
    print(str(__name__))
    return "Hello, Worlds 123!"