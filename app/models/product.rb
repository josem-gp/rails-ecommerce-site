class Product < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :order_items, dependent: :destroy

  has_many_attached :photos
  
  acts_as_favoritable

  validates :name, presence: true, uniqueness: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  # validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :availability, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }

end
