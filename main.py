from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = "123456"

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/movies/")
def movies():
    return render_template("movies.html")

@app.route("/request/")
def req():
    return render_template("request.html")

if __name__ == "__main__":
    app.run(debug=True)