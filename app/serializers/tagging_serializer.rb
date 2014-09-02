class TaggingSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :tag_id
  
  belongs_to :item, foreign_key: :item_id
  belongs_to :tag, foreign_key: :tag_id
end
