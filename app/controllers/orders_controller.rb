class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    if @order.save

      render json: @order, status: :created, location: @order
    else

      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)

      render json: @order
    else

      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:customer_id, :order_total, :order_quantity, :order_date)
  end
end
