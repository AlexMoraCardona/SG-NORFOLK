class ProductsController < ApplicationController
    require "faraday"
    #require "httparty"
    require "json"
    #include HTTParty
    require 'faraday/encoding'
    require 'rest-client'
    
    def index
            @products = Product.all 
    end    

    def new
      @product = Product.new  
    end    

    def create
        @product = Product.new(product_params)

        if @product.save then
            redirect_to products_path, notice: t('.created') 
        else
            render :new, products: :unprocessable_entity
        end    
    end    
 
    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path, notice: 'Producto actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, notice: 'Producto borrado correctamente', product: :see_other
    end   
    
    def pruebaget
        #otro llamado
        response = RestClient::Request.execute(method: :get, url: 'https://pokeapi.co/api/v2/pokemon/1',timeout: 10)
        @res = response
        puts response

    end    
    def actualizar

        json_body = '{ "class": "GET", "action": "products"}'
            
        #byebug
        #comunicacion al servicio
        response = Faraday.get('https://app.interfuerza.com/api/v4/') do |req|
          #req.headers['Content-Type'] = 'application/json'
          req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
          req.headers['body'] = json_body.to_s
          #req.body[:body] = json_body
          #req.body  = json_body
        end

        @code =  "no code"
        @respuesta = "No respuesta"

        @code =  response.status if response.present?
        @respuesta = response if response.present?

        ppppppp
        #if response.status.to_i == 200 then
        #    rrrrrrr
        #    redirect_to products_path, notice: "Productos actualizados correctamente #{@code}, Respuesta:  #{@respuesta}", product: :see_other
        #else  
        #    pppppp  
        #    redirect_to products_path, alert: "Se presentó error en la actualización de los Productos #{@code}, Respuesta:  #{@respuesta}", product: :see_other
        #end

    end    

    def actualizar_prueba

        
        #url = 'https://app.interfuerza.com/api/v4/'
        
        #otro llamado
        #response = RestClient::Request.execute(method: :get, url: 'https://pokeapi.co/api/v2/pokemon/1',timeout: 10)
        
        #otro llamado error 500
        #response = RestClient::Request.new(
        #    method: :get,
        #    url: 'https://app.interfuerza.com/api/v4/',
        #    body:  '“class”:”GET”,”action”:”products”',
        #    headers: { params: {'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'}}
        #).execute

        #otro llamado error 500
        #@payloadstring = '“class”:”GET”,”action”:”products”' 
        #response = RestClient::Request.new({
        #    method: :get,
        #    url: 'https://app.interfuerza.com/api/v4/',
        #    body:  { 'class:”GET”, action: ”products”' }.to_json,
        #    headers: { 'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'}}
        #).execute

        #prueba uno error 500 httparty
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #headers: {
        #  "Content-Type" => "application/json",
        #   "X-IFX-Token" => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz',
        #   "class" => 'GET',
        #   "action" => 'products'
        #}
        #)  

        #prueba dos error 500 httparty
        #data = { params: {“class”:”GET”,”action”:”products”} }
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #:body => data.to_json,
        #:headers => {
        #  'Content-Type' => 'application/json',
        #    'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #}
        #)  

        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #    :headers => {
        #      'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #    },
        #    :body => {
        #      :class => 'GET',
        #      :action => 'products'
        #    })

        #otra opcion
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #{ 
        #    :body => [ { "class" => "GET" , "action" => "products"} ].to_json,
        #    :headers => { 'Content-Type' => 'application/json', 'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz' }
        #   })

        # otra opcion
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #body: {"class":"GET","action":"products"},
        #headers: {
        #"content-type" => "application/json",
        #"X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz"
        #}) 

        #otra opcion
        #datos = {"class":"GET","action":"products"}
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #query: { "class":"GET","action":"products" },        
        #:body => datos.to_json,
        #:headers => {
        #'Content-Type' => 'application/json',
        #'Accept' => 'application/json',
        #'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #}) 

        #otra opcion
        #api_path = 'https://app.interfuerza.com/api/v4/'

        #headers = {"Content-Type" => "application/json", 
        #          "X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz"
        #          }
        
        #query = {"class":"GET","action":"products"}.to_json
        
        #response = HTTParty.get(api_path, headers: headers, body: query)
        

        #otra  opcion
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #headers = {  
        #  'Content-Type' => 'application/json',
        #  'Accept' => 'application/json',
        #  'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz',
        #  query = { "class":"GET","action":"products" }
        #  }) 



        #otra opcion
        #headers = {
        #  "Content-Type" => "application/json", 
        #  "X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz"
        #}   
        
        #payload = {
        #  "class":"GET","action":"products"
        #}

        #response = HTTParty.get('https://app.interfuerza.com/api/v4/', headers: headers)
        #options = {
        #body: payload.to_json, 
        #headers: headers
        #}

        #response = HTTParty.get('https://app.interfuerza.com/api/v4/', options )

        #ejemplo prueba
        #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
        #url = 'https://xkcd.com/info.0.json'
        #response = HTTParty.get(url)

        #otro intento
        #parameters = { body: { "class":"GET","action":"products" },
        #              headers: { 'Content-Type' => 'application/json', 
        #                            'Accept' => 'application/json',
        #                             'X-IFX-Token' => 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #                         }
        #}
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/", parameters)


        #otro intento
        #response = HTTParty.get("https://app.interfuerza.com/api/v4/",
        #headers: {
        #"X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz",
        #"Content-Type": "application/json",
        #"Accept" => "application/json"
        #},
        #body: {
        #  "class":"GET","action":"products"
        #})


        #faraday
        #datos = '{ "class":"GET","action":"products" }'
        #datos = JSON.parse(datos.to_json)
        #response = Faraday.new.get do |req|
        #    req.url 'https://app.interfuerza.com/api/v4/'
        #    req.headers['Content-Type'] = 'application/json'
        #    req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #    req.body = datos
            #req.body = FaradayMiddleware::ParseJson, content_type: 'application/json'
            #req.adapter Faraday.default_adapter
            #req.options.params_encoder = Faraday::FlatParamsEncoder
            #req.body[:body] = '{ "class":"GET","action":"products" }'
            #req.body = '{ "class":"GET","action":"products" }'
        #end

        #faraday2
        #connection = Faraday.get('https://app.interfuerza.com/api/v4/',
        #{ 'Content-Type' => 'application/json' },
        #    headers['Content-Type'] = 'application/json',
        #    headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz',
        #    body = JSON.generate(class: 'GET', action: 'products')
        #)
            
        #end

        #url = 'https://app.interfuerza.com/api/v4/'

        #json_body = {
        #  body:{
        #    class: "GET",
        #    action: "products"
        #  }
        #}
    
        #comunicacion al servicio
        #response = Faraday.get(url) do |req|
        #  req.headers['Content-Type'] = 'application/json'
        #  req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5'
        #  req.body  = (json_body).to_json
        #end



        #response = RestClient.get url
        #results = JSON.parse response.to_s if response.present?
        #name = results['forms'][0]['name']
        #puts response.code
        #puts "El nombre del pokemon es: #{name}"
        #put results


        #otra
        #conn = Faraday.new(url: 'https://app.interfuerza.com/api/v4/')  do |faraday|
        #    faraday.request  :url_encoded             # form-encode POST params
        #    #faraday.response :logger                  # Loggea las respuestas por STDOUT
        #    faraday.request :json                     # Peticiones en JSON
        #    #faraday.use Faraday::Adapter::NetHttp
        #    faraday.use FaradayMiddleware::ParseJson  # Middleware para parsear las respuestas a JSON
        #end

        #conn = Faraday.new(url: 'https://app.interfuerza.com/api/v4/')

        response = conn.get do |req|                         # Especificamos que es por método POST
            req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'    # Cabecera para especificar que es JSON
            #req.body = {"class":"GET","action":"products"}.to_json                             # Le asignamos el cuerpo del mensaje a la petición
            #req.params['class'] = 'GET'    # Cabecera para especificar que es JSON
            #req.params['action'] = 'products'    # Cabecera para especificar que es JSON
            #req.body = '{ "class":"GET","action":"products" }'
            req.body = JSON.generate('class:GET,action:products')
        end        

        #otra enseguida
        #response = Faraday.get('https://app.interfuerza.com/api/v4/',
        #    headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #    body = (class: 'GET', action: 'products')
        #)
                    
        #otra
        #params = '{ "class": "GET", "action": "products" }'
        #headers = "X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz"
        #response = Faraday.new(url: 'https://app.interfuerza.com/api/v4/', params: params,
        #  headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz'
        #end
        #)
        
        #otra
        #response = {:method=>:get, :url=>"https://app.interfuerza.com/api/v4/", :params=>nil, :headers=>{"X-IFX-Token" => "cc83f4f08b4d1e910ee6d43d08b4a7d5-tvdf-ooyaybwz"}, :body=>{"class":"GET","action":"products"}}

        @code =  "no code"
        @respuesta = "No respuesta"

        @code =  response.status if response.present?
        @respuesta = response if response.present?

        if response.status.to_i == 200 then
            rrrrrrr
            redirect_to products_path, notice: "Productos actualizados correctamente #{@code}, Respuesta:  #{@respuesta}", product: :see_other
        else  
            pppppp  
            redirect_to products_path, alert: "Se presentó error en la actualización de los Productos #{@code}, Respuesta:  #{@respuesta}", product: :see_other
        end

    end    


    def servicio
        url = 'https://app.interfuerza.com/api/v4/'

        #Json request body
        json_body = {
          body:{
            class: "GET",
            action: "products"
          }
        }
    
        #comunicacion al servicio
        response = Faraday.get(url) do |req|
          req.headers['Content-Type'] = 'application/json'
          req.headers['X-IFX-Token'] = 'cc83f4f08b4d1e910ee6d43d08b4a7d5'
          req.body  = (json_body).to_json
        end
    
        return {success: false, status: 200, response: 'Error', message: "Sin respuesta del servi"}
    end    

    private

    def product_params
        params.require(:product).permit(:name, :description, :brands, :type_product, 
        :category_l1, :category_l2, :category_l3, :cost, :codigo_inter, :id_inter,
        :state_product, :detail, :item_number, :store_product, :taxid)
    end 

end  
