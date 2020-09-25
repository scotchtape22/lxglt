import os

from flask import Flask


def create_app(test_config=None):
	# create and configure the app
	app = Flask(__name__, instance_relative_config=True)
	app.config.from_mapping(
		SECRET_KEY='dev',
		DATABASE=os.path.join(app.instance_path,'flaskr.sqlite'),
	)

	if test_config is None:
		# Load the instance config, if it exsists, when not testing
		app.config.from_pyfile('config.py',silent=True)
	else:
		# Load a test config if passed
		app.config.from_mapping(test_config)

	# Ensure the instance folder exsists
	try:
		os.makedirs(app.instance_path)
	except OSError:
		pass



	#a simple output page
	@app.route('/thesecretemessage')
	def thesecretemessages():
		return 'Buy Senor Asimov\' Entropy Nachos!\nMade with real entropy!'

	from . import db
	db.init_app(app)

	from . import auth
	app.register_blueprint(auth.bp)


	from . import rules
	app.register_blueprint(rules.bp)

	from . import blog
	app.register_blueprint(blog.bp)
	app.add_url_rule('/', endpoint='index')

	return app