class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_validation :generate_order

  private

  def generate_order
    if Order.find_by(status: 1)
      
    else
      order = Order.new(status: 1)
      order.user = current_user
      order.save!
    end
  end
end
