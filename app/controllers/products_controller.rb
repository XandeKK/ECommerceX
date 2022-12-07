class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :define_product
  before_action :redirect_if_empty

  def show
  end

  private

  def define_product
    @product = Product.find_by(id: params[:id])
  end

  def redirect_if_empty
    redirect_to root_path if @product.nil?
  end
end
