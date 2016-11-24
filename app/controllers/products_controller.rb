class ProductsController < ApplicationController
  def index
    sort = params[:sort]
    discount = params[:discount]
    random = params[:random]
    if sort
      @product_all = Product.order(params[:sort])
    elsif discount
      @product_all = Product.where('price < ?', params[:discount])
    elsif random
      @product_all = Product.order('RANDOM() LIMIT 1')
    else
      @product_all = Product.order(:price)
    end
    image = Image.all
    render 'index.html.erb'
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
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
