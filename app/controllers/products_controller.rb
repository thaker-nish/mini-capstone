class ProductsController < ApplicationController
  def product_list_method
    @product_all = Product.all
    render 'product_list.html.erb'
  end

  def product1_method
    @product1 = Product.first
    @product1_name = @product1.name
    @product1_price = @product1.price
    @product1_image = @product1.image
    @product1_description = @product1.description
    render 'product1.html.erb'
  end
    def product2_method
    @product2 = Product.second
    @product2_name = @product2.name
    @product2_price = @product2.price
    @product2_image = @product2.image
    @product2_description = @product2.description
    render 'product2.html.erb'
  end

    def product3_method
    @product3 = Product.third
    @product3_name = @product3.name
    @product3_price = @product3.price
    @product3_image = @product3.image
    @product3_description = @product3.description
    render 'product3.html.erb'
  end

  def new_product_method
    render 'new_product.html.erb'
  end

  def add_new_product_method
    render 'add_new_product.html.erb'
  end
end
