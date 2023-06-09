class Api::V1::PaymentsController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @payments = Payment.all
    render json: @payments
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: @payment, status: :created, location: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end

  private

  def payment_params
    params.require(:payment).permit(:order_id, :payment_amount, :payment_date, :payment_method)
  end
end
