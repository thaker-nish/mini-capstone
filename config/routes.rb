Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/product_list_url' => 'products#product_list_method'
  get '/product1_url' => 'products#product1_method'
  get '/product2_url' => 'products#product2_method'
  get '/product3_url' => 'products#product3_method'
  get '/new_product_form_url' => 'products#new_product_method'
  post 'add_new_product_url' => 'products#add_new_product_method'
end
