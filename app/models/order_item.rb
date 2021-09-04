class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_validation :generate_order

  private

  def generate_order
    if Order.find_by(status: 1)
      order = Order.find_by(status: 1)
      self.order = order
    else
      order = Order.new(status: 1, total: 0, subtotal: 0, date: Date.today())
      order.user = current_user
      order.save!
      self.order = order 
    end
  end
end
