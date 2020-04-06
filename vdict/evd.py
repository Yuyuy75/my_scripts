#!/usr/bin/python3

import requests

res = requests.get( 'https://vdict.com/amiable,1,0,0.html' )
print( res.text[:] )
