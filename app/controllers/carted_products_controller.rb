class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
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
    flash[:success] = 'Added to cart successfully!'
    redirect_to '/products'
  end

  def destroy
    carted_product = CartedProduct.find_by(status: "carted", id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    redirect_to '/carted_products'

  end
end
