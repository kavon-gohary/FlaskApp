from flask import Flask
from flask import render_template           # modularity of flask. even though temrplates are neccesary for anythong
                                            # flask will not force it on you.  really good quality
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
bootstrap = Bootstrap(app)

# @app.route("/")
# @app.route("/<name>")
# def hello(name=None):
#     return render_template("hello.html", name=name)


@app.route("/hello")
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)


@app.route("/")
@app.route("/home")
def main_pg():
    return render_template('frontpg.html')


@app.route('/about')
def person():
    return render_template('user.html')


@app.route('/contact')
def contacts():
    return render_template('contact2.html')
#
# @app.route("/double/<int:num>")
# def show_num(num):
#     return "%d" % (num+3)
#     #return num         for some reason this throws an error


if __name__ =="__main__":
    app.run(debug=True)
#host='0.0.0.0', port=80,
#host='0.0.0.0' is python telling the computer to listen for all IP addresses
#in other words take requests from all public IP addresses.
#remember that a host is just any computer connected to a network (in our case the internet)
