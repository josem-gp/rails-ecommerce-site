class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

   
  #status 1 => open // status 2 => completed  
  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  #the date at first will be the creation date but it has to change to the date-time where we did the CHECKOUT
  validates :date, presence: true
  
  validates :total, presence: true, numericality: { only_integer: true }

  after_save :most_featured
  after_save :merge_order_items
  before_create :add_billing_address

  private

  def self.update_total(order)
    total = 0
    order.order_items.each do |order_item|
      order_quantity = 
        if order_item.quantity.nil? 
          1
        else
          order_item.quantity
        end
      total += (order_item.product.price * order_quantity)
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
        item_quantity = 
        if item.quantity.nil? 
          1
        else
          item.quantity
        end

        total += item_quantity
        order_items.where(product_id: duplicate_id).first.update({quantity: total})
        order_items.where(product_id: duplicate_id)[1..-1].each { |el| el.delete }
      end
    end
  end

  def add_billing_address    
    shipping_address = self.user.shipping_address
    self.billing_address = shipping_address
  end

  def most_featured
    featured_items= OrderItem.joins("INNER JOIN orders ON orders.id = order_items.order_id WHERE status = 2").group(:product_id).sum(:quantity)
    featured_items.each do |prod_id, quantity|
      Product.find(prod_id).update(sales: quantity)
    end
  end
end