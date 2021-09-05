class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  private

  def self.generate_order(user)
    if Order.where(user: user, status: 1).exists? 
      order = Order.where(user: user, status: 1)[0]
    else
      order = Order.new(status: 1, total: 0, date: Date.today())
      order.user = user 
      order.save!
    end
    return order
  end
end
