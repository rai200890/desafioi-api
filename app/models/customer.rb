class Customer < ApplicationRecord

  has_many :issues

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :id_card_code, presence: true, uniqueness: true

  scope :by_name_or_id_card_code_or_phone, ->(text) do
     replacement = "%#{text}%"
     where('name LIKE UPPER(?)', replacement)
     .or(self.where('id_card_code LIKE UPPER(?)',replacement))
  end

end
