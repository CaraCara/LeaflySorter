require 'rubygems'
require 'json'
require 'jsonpath'

#Pulls ALL of menu from Human Collective
data = `curl -v -H "app_id:6682ef51" -H "app_key:55c6b0efcd2e2549ff360a5dde136a50" -X GET "http://data.leafly.com/locations/human-collective/menu"`

#Sample return:

# {
#  "name": "WAX - (PROPER) OG KUSH BHO",
#  "description": "THC. 85.6%\nCBD. 1.08%",
#  "addedOn": "/Date(1425082580488+0000)/",
#  "type": "Concentrate",
#  "pricing": [
#   {
#    "Unit": "Gram",
#    "Price": 19
#   }
#  ]
 #}

#puts data



isolate_concentrate = JsonPath.new('$.[?(@.type == "Concentrate")]')
	#include a for/each loop here that parses each grouping and then groups them together/displays them, maybe making a database? Would be nice for tracking price fluctuations, growth cycles, growers, etc.
formatted_data = isolate_concentrate.on(data)

#This results in HASHES embedded inside of an Array!!!!!

#This sequence collects all the 'names' from the array!
c = formatted_data.each.map {|x| x["name"]}
#you grab the hashes by calling formatted_data[40]['name']
puts c
