class Issue < ApplicationRecord
  belongs_to :customer
  belongs_to :issue_type
  belongs_to :issue_reason
  belongs_to :state

  validates :customer, presence: true
  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

  scope :group_by_creation_and_state, -> { group('issues.created_at', 'issues.state_id') }
  scope :sort_by, -> field, order {
    with_details.group_by_creation_and_state.order("#{get_sort_field(field)} #{get_sort_order(order)}")
  }
  scope :with_details, -> { eager_load(:customer, :issue_type, :issue_reason, :state) }

  private

  FIELDS = {
    created_at: 'issues.created_at',
    type: 'issue_types.name',
    reason: 'issue_reasons.name',
    state: 'states.name'
  }

  def self.get_sort_field(field)
    FIELDS[field.downcase.to_sym] || FIELDS[:created_at]
  end

  def self.get_sort_order(order)
    order.to_s.upcase.in?(["ASC", "DESC"]) ? order.upcase : "ASC"
  end

end
