class Product < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { 
      prefix: true,
      highlight: {
        StartSel: '<b>',
        StopSel: '</b>',
        MaxWords: 123,
        MinWords: 456,
        ShortWord: 4,
        HighlightAll: true,
        MaxFragments: 3,
        FragmentDelimiter: '&hellip;'
      }
    }
  }

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :order_items, dependent: :destroy

  has_many_attached :photos
  
  acts_as_favoritable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  # Availability: 1 available / 2 unavailable
  validates :availability, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }

  before_validation :initial_sales, on: :create

  private 

  def self.order_list(sort_by)
    case sort_by
    when 'featured'
      self.order(sales: :desc)
    when 'name A-Z'
      self.order(:name)
    when 'name Z-A'
      self.order(name: :desc)
    when 'rating 1-5'
      self.order(:rating)
    when 'rating 5-1'
      self.order(rating: :desc)
    when 'price low-high'
      self.order(:price)
    when 'price high-low'
      self.order(price: :desc)
    when 'date old-new'
      self.order(:updated_at)
    when 'date new-old'
      self.order(updated_at: :desc)
    else 
      self.order(sales: :desc)
    end
  end
 
  def initial_sales
    self.sales = 0
  end
end
