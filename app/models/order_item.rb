class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_validation :generate_order

  private

  def self.generate_order(user)
    if Order.find_by(status: 1)
      order = Order.find_by(status: 1)
    else
      order = Order.new(status: 1, total: 0, subtotal: 0, date: Date.today())
      order.user = user 
      order.save!
    end
    return order
  end
end
