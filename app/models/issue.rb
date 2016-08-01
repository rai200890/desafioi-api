class Issue < ApplicationRecord

  belongs_to :issue_type
  belongs_to :issue_reason

  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

end
