class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save

      render json: @order, status: :created, location: @order
    else

      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)

      render json: @order
    else

      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :order_total, :order_quantity, :order_date)
  end
end
