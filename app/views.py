from flask import Flask, Response

app = Flask(__name__)


@app.route("/")
def hello():
    return "I'm alive!"


@app.route("/ping")
def balancer_health_check():
    return Response(status=200)


if __name__ == '__main__':
    app.run()
