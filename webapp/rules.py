from flask import (
	Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('rules', __name__)

@bp.route('/the_rules')
def the_rules():
	return render_template('rules.html')
