class Issue < ApplicationRecord

  belongs_to :customer
  belongs_to :issue_type
  belongs_to :issue_reason
  belongs_to :state

  validates :customer, presence: true
  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

 scope :group_by_creation_and_state, ->{joins(:state).group(:created_at, :state_id)}
 scope :order_by_date, ->{order("created_at DESC")}
 scope :with_details, ->{eager_load(:customer, :issue_type, :issue_reason, :state)}
end
