from flask import Flask

app = Flask(__name__)

@app.route('/', defaults={'path': ''}, methods=['GET', 'POST'])
@app.route('/<path:path>', methods=['GET', 'POST'])
def hello(path):
    return 'Hello!', 200, {'Content-Type': 'text/plain'}

if __name__ == '__main__':
    app.run()