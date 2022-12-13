class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  before_action :define_product, except: [:new, :create]

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params

    if @product.save
      create_product @product
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
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, status: :not_found # add alert
    end
  end

  def create_product product
    stripe_product = Stripe::Product.create(
      {
        name: product.name,
        description: product.desc,
        url: product_url(product.id)
        # add images
      }
    )
    create_price(product, stripe_product)
  end

  def create_price(product, stripe_product)
    price = Stripe::Price.create(
      {
        unit_amount: real_to_centavos(product.price),
        currency: 'brl',
        product: stripe_product.id
      }
    )
    Price.create!(product: product, stripe_price_id: price.id)
  end

  def real_to_centavos price
    (price * 100).to_i
  end
end
