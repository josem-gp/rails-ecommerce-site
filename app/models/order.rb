class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :date, presence: true
  validates :subtotal, presence: true, numericality: { only_integer: true }
  validates :total, presence: true, numericality: { only_integer: true }
end
