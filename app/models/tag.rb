class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :items, through: :taggings

  # scope class method stores an attribute from a permitted params,
  # and performs a query for a name with the stored attribute
  scope :same_tag, -> (tag_name) { where( name: tag_name ) }

end
