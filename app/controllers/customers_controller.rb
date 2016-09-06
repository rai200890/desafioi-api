class CustomersController < ApplicationController
  include PaginationConcern

  has_scope :by_name_or_id_card_code_or_phone
  has_scope :page, default: 1
  has_scope :per, default: 15

  def index
     @customers = apply_scopes(Customer).all
     render json: @customers, meta: pagination_info(@customers)
  end

end
