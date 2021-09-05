class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  #status 1 => open // status 2 => completed
  validates :date, presence: true
  #the date at first will be the creation date but it has to change to the date-time where we did the CHECKOUT
  validates :subtotal, presence: true, numericality: { only_integer: true }
  #maybe i dont need subtotal...
  validates :total, presence: true, numericality: { only_integer: true }

end