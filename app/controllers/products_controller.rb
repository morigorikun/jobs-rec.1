class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
  end

  def create
    Product.create(machine: product_params[:machine], name: product_params[:name], text: product_params[:text], user_id: current_user.id)
  end

  def destroy
    product = Product.find(params[:id])
    if product.user.id == current_user.id
      product.destroy
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if current_user.id == product.user.id
      product.update(product_params)
    end
  end

  def show
    @product = Product.find(params[:id])
    @contents = @product.contents.includes(:user).order("created_at desc")
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("created_at desc")
  end

  def machine_search
    @products = Product.where('machine LIKE(?)', "%#{params[:keyword]}%").order("created_at desc")
  end

  private
  def product_params
    params.permit(:machine ,:name, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
