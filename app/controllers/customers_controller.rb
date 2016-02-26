class CustomersController < ApplicationController


  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    end
  end

  def show
    @customer = Customer.find_by(params[:id])
  end

  def edit
    @customer = Customer.find_by(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:account, :balance, :birthday, :secret )
  end


end