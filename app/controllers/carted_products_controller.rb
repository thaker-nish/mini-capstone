class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(status: "carted")
    if @carted_products.length != 0
    render 'index.html.erb'
  else 
    redirect_to '/products'
  end
  end
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    carted_product.save
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find_by(status: "carted", id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    redirect_to '/products'

  end
end
