require 'rest-client'
        
        
        #otro llamado error 500
        response = RestClient::Request.new(
            method: :get,
            url: 'https://app.interfuerza.com/api/v4/',
            body:  '“class”:”GET”,”action”:”products”',
            headers: { 'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'}
        ).execute
        puts response