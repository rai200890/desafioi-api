class Issue < ApplicationRecord
  belongs_to :customer
  belongs_to :issue_type
  belongs_to :issue_reason
  belongs_to :state

  validates :customer, presence: true
  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

  scope :sort_by, -> (*sorters) do
    sorters = sorters.map{|field, sort_order| "#{get_sort_field(field)} #{get_sort_order(sort_order)}"}
    with_details.order(sorters)
  end

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

  def self.get_sort_order(sort_order)
    sort_order.to_s.upcase.in?(["ASC", "DESC"]) ? sort_order.to_s.upcase : "ASC"
  end

end
