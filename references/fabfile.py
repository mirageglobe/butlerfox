from fabric.api import local, settings, abort
from fabric.contrib.console import confirm

def hello():
    print("Hello world!")