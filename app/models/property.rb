class Property < ApplicationRecord
  belongs_to :agent, class_name: "User"
  has_many :transactions, dependent: :destroy
  has_many :property_tags, dependent: :destroy
  has_many :tags, through: :property_tags, dependent: :destroy

  validates :title, :price, presence: true
end
