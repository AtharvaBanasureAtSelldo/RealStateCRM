# For Agents, Admins, Customers
class User < ApplicationRecord
  has_many :properties, foreign_key: :agent_id
  has_many :appointments
  has_many :transactions

  validates :email, presence: true, uniqueness: true
end
