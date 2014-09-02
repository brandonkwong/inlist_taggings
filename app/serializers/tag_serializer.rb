class TagSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  has_many :taggings, dependent: :destroy
  has_many :items, through: :taggings
end
