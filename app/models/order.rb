class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

   
  #status 1 => open // status 2 => completed  
  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  #the date at first will be the creation date but it has to change to the date-time where we did the CHECKOUT
  validates :date, presence: true
  
  validates :total, presence: true, numericality: { only_integer: true }

  after_save :merge_order_items

  private

  def self.update_total(order)
    total = 0
    order.order_items.each do |order_item|
      total += (order_item.product.price * order_item.quantity)
    end
    return total
  end

  def merge_order_items
    total = 0
    order_items = self.order_items
    # first find which product_id is repeated in the order
    if order_items.group_by{ |e| e.product_id }.select { |k, v| v.size > 1 }.map(&:first)
      # then find the order_items in that order whose product_id is the one we found before
      duplicate_id = order_items.group_by{ |e| e.product_id }.select { |k, v| v.size > 1 }.map(&:first)[0]
      order_items.where(product_id: duplicate_id).each do |item|
        total += item.quantity
        order_items.where(product_id: duplicate_id).first.update({quantity: total})
        order_items.where(product_id: duplicate_id)[1..-1].each { |el| el.delete }
      end
    end
  end

end