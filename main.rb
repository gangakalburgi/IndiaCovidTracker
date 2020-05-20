# require 'rubygems'
#require 'httparty'
require 'sinatra'
require 'net/http'
require 'json'



# class Educationcorona
# 	include HTTParty
# 	# base_uri "covid19.mathdro.id/api/countries"

	configure do
  		enable :sessions     # set :sessions, true
 	end



	get '/' do
		url ='https://covid19.mathdro.id/api/countries/ind'
		uri = URI(url)
		response = Net::HTTP.get(uri)

		# cases = JSON.parse(response.body)

		json_object = JSON.parse(response,object_class: OpenStruct)
		
		session[:confirmed] = json_object.confirmed.value
		
		session[:recovered] = json_object.recovered.value
		session[:deaths] = json_object.deaths.value

		
		erb :home

		
	end
	



	# post '/' do
	# 	url ='https://covid19.mathdro.id/api/countries/ind'
	# 	uri = URI(url)
	# 	response = Net::HTTP.get(uri)

	# 	# cases = JSON.parse(response.body)

	# 	json_object = JSON.parse(response,object_class: OpenStruct)
		
	# 	# session[:confirmed] = json_object.confirmed.value
		
	# 	# session[:recovered] = json_object.recovered.value
	# 	# session[:deaths] = json_object.deaths.value

	# 	session[:confirmed] = 100
	# 	erb :home


	# end


	# def posts
	# 	url = 'https://covid19.mathdro.id/api/countries/ind'
	# 	response = HTTParty.get(url)
	# 	response.parsed_response
		
	# end


