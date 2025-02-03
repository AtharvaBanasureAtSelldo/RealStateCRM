class Tag < ApplicationRecord
  has_many :property_tags
  has_many :properties ,through: :property_tags
end
