class Api::V1::CategoriesController < ApplicationController
  skip_before_action :authorized
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @categories = Category.all
    # for the category we want to list all the food items it contains and add that to the json response
    @categories = @categories.as_json.map do |category|
      # find all food items with the same category id as the current category
      product = Product.where(category_id: category['id'])
      # add the food items to the current category
      category.merge({ products: product })
    end

    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    # for the category we want to list all the food items it contains and add that to the json response
    @category = @category.as_json
    # find all food items with the same category id as the current category
    product = Product.where(category_id: @category['id'])
    # add the food items to the current category
    @category.merge!({ products: product })
    render json: @category
  end

  def new
    @category = Category.new(category_params)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :category_image)
  end
end
