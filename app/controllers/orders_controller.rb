class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params['product_id'])
    @subtotal = product.price * params['quantity'].to_i
    @tax = @subtotal * 0.09
    @total = @subtotal + @tax

    order = Order.new(
      product_id: params['product_id'],
      quantity: params['quantity'],
      user_id: current_user.id,
      subtotal: @subtotal,
      tax: @tax,
      total: @total,
    )
    order.save
    flash[:success] = "Your order was successfully created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @product = Product.find_by(id: params['product_id'])
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

end
