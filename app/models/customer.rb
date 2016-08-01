class Customer < ApplicationRecord

  has_many :issues

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :id_card_code, presence: true, uniqueness: true

end
