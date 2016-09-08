class Issue < ApplicationRecord
  belongs_to :customer
  belongs_to :issue_type
  belongs_to :issue_reason
  belongs_to :state

  validates :customer, presence: true
  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

  scope :with_details, -> { eager_load(:customer, :issue_type, :issue_reason, :state) }

  scope :group_by_date_and_state, -> do
    with_details.order('states.name asc', created_at: :desc)
  end

end
