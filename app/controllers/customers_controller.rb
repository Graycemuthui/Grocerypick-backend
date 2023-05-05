class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:name, :customer_email, :address, :phone, :state, :city, :zip)
  end
end
