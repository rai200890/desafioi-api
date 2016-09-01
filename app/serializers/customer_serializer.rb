class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :id_card_code
end
