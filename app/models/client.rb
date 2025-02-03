class Client < ApplicationRecord
  has_many :appointments
  has_many :transactions

  validates :email, presence: true, uniqueness: true
end

