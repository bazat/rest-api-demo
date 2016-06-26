class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customer_name, :customer_phone, :order
end
