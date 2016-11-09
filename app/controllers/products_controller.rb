class ProductsController < ApplicationController
  def product_list_method
 @product_all = Product.all
    render 'product_list.html.erb'
  end
end
