class ProductsController < ApplicationController
  def index
    @product_all = Product.all
    render 'index.html.erb'
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
    flash[:success] = 'New product successfully created!'
    redirect_to '/products'
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
    flash[:success] = 'Product successfully updated!'
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = 'Product successfully destroyed!'
    redirect_to '/products'
  end
end
