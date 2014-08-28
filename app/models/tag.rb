class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :items, through: :taggings

  # Note: presence for testing only
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :same_tag, -> (tag_name) { where( name: tag_name ) }

end
