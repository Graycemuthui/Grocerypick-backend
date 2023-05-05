class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:category_name)
  end
end
