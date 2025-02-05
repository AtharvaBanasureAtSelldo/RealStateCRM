class Transaction < ApplicationRecord
  belongs_to :property
  belongs_to :client, class_name: "User"
  belongs_to :user

  validates :status, inclusion: { in: ["pending", "completed", "cancelled"] }


  before_save :set_default_status
  after_update :mark_property_as_sold, if: -> { status_changed? && status == "completed" }
  after_create :send_notification


  private

  def set_default_status
    self.status ||= "pending"
  end

  def mark_property_as_sold
    property.update(sold: true)
  end

  def send_notification
    puts "Transaction created: #{self.id}, status: #{self.status}"
  end
end
