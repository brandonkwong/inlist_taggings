class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
