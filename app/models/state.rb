class State < ApplicationRecord

  validates :abbreviation, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
