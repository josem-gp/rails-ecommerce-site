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

  validates :name, presence: true, uniqueness: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  # Availability: 1 available / 2 unavailable
  validates :availability, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }

  before_validation :initial_sales, on: :create

  private 

  def self.order_list(sort_by)
    if sort_by == 'featured' || sort_by.blank?
      self.order(sales: :desc)
    elsif sort_by == 'name A-Z' 
      self.order(name: :asc)
    elsif sort_by == 'name Z-A'
      self.order(name: :desc)
    elsif sort_by == 'rating 1-5'
      self.order(:rating)
    elsif sort_by == 'rating 5-1'
      self.order(rating: :desc)
      elsif sort_by == 'price low-high'
      self.order(:price)
    elsif sort_by == 'price high-low'
      self.order(price: :desc)
    elsif sort_by == 'date old-new'
      self.order(:updated_at)
    elsif sort_by == 'date new-old' 
      self.order(updated_at: :desc)
    end
  end
 
  def initial_sales
    self.sales = 0
  end
end
