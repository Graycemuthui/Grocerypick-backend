class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: @payment, status: :created, location: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:order_id, :payment_amount, :payment_date, :payment_method)
  end
end
