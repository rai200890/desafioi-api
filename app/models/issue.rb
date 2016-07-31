class Issue < ApplicationRecord

  validates :issue_type_id, presence: true
  validates :issue_reason_id, presence: true
  validates :body, presence: true

end
