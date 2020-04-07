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

# get searched word
word_title          = res.text.find( "word_title" )
skip_to_word        = len( "word_title\">\n\t" )
start_index_word    = word_title + skip_to_word
word_len            = len( word )
end_index_word      = start_index_word + word_len

print( res.text[start_index_word:end_index_word] )

# get pronunciation
pronounce           = res.text.find( "pronounce" )
skip_to_word        = len( "pronounce\">/" )
start_index_word    = pronounce + skip_to_word
end_index_word      = res.text.find( "/<", pronounce )

print( res.text[start_index_word:end_index_word] )

# get phanloai
word_type           = res.text.find( "phanloai" )
skip_to_word        = len( "phanloai\">" )
start_index_word    = word_type + skip_to_word
end_index_word      = res.text.find( "<", word_type )

print( res.text[start_index_word:end_index_word] )
