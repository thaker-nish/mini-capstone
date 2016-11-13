class ProductsController < ApplicationController
  def index
    @product_all = Product.all
    render 'product_list.html.erb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.new(
      name: params['name'],
      image: params['image'],
      price: params['price'],
      description: params['description']
    )
    product.save
    render 'create.html.erb'
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.image = params[:image]
    product.price = params[:price]
    product.description = params[:description]
    product.save
    render 'update.html.erb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.html.erb'
  end
end
