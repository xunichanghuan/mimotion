from flask import Flask
from flask import request
from flask import jsonify

from _mimotion import mimotion

app = Flask(__name__)


@app.route("/mimotion", methods=["GET", "POST"])
def routerMimotion():
    user = request.args.get("u")
    pwd = request.args.get("p")
    step = request.args.get("s")
    if user == None:
        return jsonify({"error": "missing parameter: u, need username"})
    if pwd == None:
        return jsonify({"error": "missing parameter: p, need password"})
    if step == None:
        return jsonify({"error": "missing parameter: s, need step"})

    return jsonify(mimotion(user, pwd, step))


if __name__ == "__main__":
    app.run()
