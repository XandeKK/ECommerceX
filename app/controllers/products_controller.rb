class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  before_action :define_product, except: [:new, :create]
  before_action :redirect_if_empty, except: [:new, :create]

  def show
  end

  def new
  end

  def create
    @product = Product.new product_params

    if @product.save
      redirect_to product_path(@product) # add notice
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product) # add notice
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path # add notice
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku, :desc, :price)
  end

  def define_product
    @product = Product.find_by(id: params[:id])
  end

  def redirect_if_empty
    redirect_to root_path if @product.nil?
  end
end
