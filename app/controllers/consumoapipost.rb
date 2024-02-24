require 'json'
require 'rest-client'

#response = RestClient.post('https://httpbin.org/post', {name: 'CodigoFacilito'})
#puts response.code


#otra forma
response = RestClient::Request.new(
  :method => :post,
  :url => 'https://httpbin.org/post',
  :payload => { name: 'CodigoFacilito'}
).execute

puts response
