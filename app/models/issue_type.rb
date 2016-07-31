class IssueType < ApplicationRecord

  validates :name, presence: true, uniqueness: true

end
