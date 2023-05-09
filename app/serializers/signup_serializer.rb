class SignupSerializer < ActiveModel::Serializer
  attributes :id
  has_one :activity
  has_one :camper
end
