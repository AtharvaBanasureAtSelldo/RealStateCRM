class Tag < ApplicationRecord
  has_many :property_tags, dependent: :destroy
  has_many :properties ,through: :property_tags, dependent: :destroy
end
