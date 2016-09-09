class Customer < ApplicationRecord

  has_many :issues

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :id_card_code, presence: true, uniqueness: true

  scope :by_id_or_name_or_email_or_phone, -> (text) do
     replacement = "%#{text}%"
     where('name LIKE UPPER(?)', replacement)
     .or(self.where(id: text))
     .or(self.where('email LIKE(?)', replacement))
     .or(self.where('phone LIKE(?)', replacement))
  end

end
