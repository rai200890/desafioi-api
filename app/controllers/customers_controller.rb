class CustomersController < ApplicationController
  include PaginationConcern

  has_scope :by_id_or_name_or_email_or_phone
  has_scope :page, default: 1
  has_scope :per, default: 15

  def index
     @customers = apply_scopes(Customer).all
     render json: @customers, meta: pagination_info(@customers)
  end

  def create
    @customer = Customer.new customer_params
    if @customer.save
      render json: @customer, status: :created
    else
      render json: {errors: @customer.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :id_card_code)
  end

end
