require 'json'
require 'rest-client'
require 'faraday'
url = 'https://pokeapi.co/api/v2/pokemon/1/'

#otro llamado
response = RestClient::Request.execute(method: :get, url: 'https://pokeapi.co/api/v2/pokemon/1',timeout: 10)
puts response
#otro llamado



#response = RestClient.get url
##results = JSON.parse response.to_str
#name = results['forms'][0]['name']
#puts response.code
#puts "El nombre del pokemon es: #{name}"

#url = 'https://app.interfuerza.com/api/v4/'

#Json request body
#json_body = {
#  body:{
#    class: "GET",
#    action: "products"
#  }
#}
#byebug
#comunicacion al servicio
#response = Faraday.get(url) do |req|
#  req.headers['Content-Type'] = 'application/json'
#  req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5'
#  req.body  = (json_body).to_json
#end

#return {success: false, status: 200, response: 'Error', message: "Sin respuesta del servi"}
