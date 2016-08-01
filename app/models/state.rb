class State < ApplicationRecord

  has_many :issues

  validates :abbreviation, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
