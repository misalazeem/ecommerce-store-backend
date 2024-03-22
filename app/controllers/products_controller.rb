lass ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all

    # Filter by category if category paramter is provided
    if params[:category].present?
      category = Category.find_by(name: params[:category])
      @products = category.products if category
    end

    # Search

    if params[:search].present ?
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    #Paginate

    page = params[:page] || 1
    per_page = params[:limit] || 10

    @products = @products.paginate(page: page, per_page: per_page)

    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @products.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, images: [])
  end
end
