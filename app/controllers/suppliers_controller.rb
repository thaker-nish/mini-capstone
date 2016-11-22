class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    supplier = Supplier.new(
      name: params['name'],
      email: params['email'],
      phone: params['phone']
    )
    supplier.save
    redirect_to '/suppliers'
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone = params[:phone]
    supplier.save
    redirect_to "/suppliers/#{supplier.id}"
  end

  def destroy
  end
end
