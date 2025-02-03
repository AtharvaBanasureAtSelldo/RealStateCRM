class Property < ApplicationRecord
  belongs_to :agent, class_name: "User"
  has_many :transactions
  has_many :property_tags
  has_many :tags, through: :property_tags

  validates :title, :price, presence: true
end
