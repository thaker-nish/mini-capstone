Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/product2_url' => 'products#product2_method'
  get '/product3_url' => 'products#product3_method'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products'
end
