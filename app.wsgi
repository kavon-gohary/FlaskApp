import sys
import logging
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/var/www/appFolder/")

# home points to the home.py file
from home import app as application
application.secret_key = "somesecretsessionkey"
