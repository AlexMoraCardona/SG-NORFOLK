Rails.application.routes.draw do

  root :to =>  'homes#index' 
  get 'home', to:  "homes#index"
  
  namespace :authentication, path: '', as: ''  do
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
  end  

  resources :levels
  resources :customers
  resources :contacts  
  resources :analysts
  resources :cost_centers
  resources :contract_products
  resources :entities


  resources :contracts do
    collection do
      get '/contracts/crear_contrato/:id', to: 'contracts#crear_contrato', as: 'crear_contrato'
      get '/contracts/crear_contrato_producto/:id', to: 'contracts#crear_contrato_producto', as: 'crear_contrato_producto'
    end  
  end  

  get '/users/cambioempresa' => 'users#cambioempresa', as: 'cambioempresa'
  get '/pre_invoices/clientes' => 'pre_invoices#clientes', as: 'clicot'
  get '/pre_invoices/estados' => 'pre_invoices#estados', as: 'estcot'
  get '/pre_invoices/radicaciones' => 'pre_invoices#radicaciones', as: 'radcot'

  get '/products/actualizar' => 'products#actualizar', as: 'actualizar'
  get '/products/pruebaget' => 'products#pruebaget', as: 'pruebaget'
  
  #get '/consumoapiget' => '/consumoapiget', as: 'consumoapiget'

  resources :pre_invoices do
    collection do
      get '/pre_invoices/cc/:id', to: 'pre_invoices#cc', as: 'cc'
    end
  end


  resources :products
end
