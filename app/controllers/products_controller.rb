class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |_format|
      @product = Product.find(params[:id])
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def product_params
    params.fetch(:product, {})
  end
end
