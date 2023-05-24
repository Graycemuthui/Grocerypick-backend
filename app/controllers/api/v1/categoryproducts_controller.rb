class CategoryproductsController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @categoryproducts = Categoryproduct.all
    render json: @categoryproducts
  end

  def show
    @categoryproduct = Categoryproduct.find(params[:id])
    render json: @categoryproduct
  end

  def new
    @categoryproduct = Categoryproduct.new
  end

  def create
    @categoryproduct = Categoryproduct.new(categoryproduct_params)

    if @categoryproduct.save
      render json: @categoryproduct, status: :created, location: @categoryproduct
    else
      render json: @categoryproduct.errors, status: :unprocessable_entity
    end
  end

  def update
    @categoryproduct = Categoryproduct.find(params[:id])

    if @categoryproduct.update(categoryproduct_params)
      render json: @categoryproduct
    else
      render json: @categoryproduct.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @categoryproduct = Categoryproduct.find(params[:id])
    @categoryproduct.destroy
  end

  private

  def categoryproduct_params
    params.require(:categoryproduct).permit(:category_id, :product_id)
  end
end
