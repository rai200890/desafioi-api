class Issue < ApplicationRecord

  belongs_to :customer
  belongs_to :issue_type
  belongs_to :issue_reason
  belongs_to :state

  validates :customer, presence: true
  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

end
