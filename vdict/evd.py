#!/usr/bin/python3

import requests
import string
import sys

url_prefix      = "https://vdict.com/"
word            = sys.argv[1]
eng_to_viet     = ",1,0,0.html"
viet_to_eng     = ",2,0,0.html"
viet_to_viet    = ",3,0,0.html"
search_url      = url_prefix + word + eng_to_viet
res             = requests.get( search_url )

word_len            = len( word )
word_title          = res.text.find( "word_title" )
skip_word_title     = len( "word_title\">\n\t" )
start_index_word    = word_title + skip_word_title
end_index_word      = start_index_word + word_len

print( res.text[start_index_word:end_index_word] )
