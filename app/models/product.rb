class Product < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true,
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

end
