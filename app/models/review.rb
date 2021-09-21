class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, presence: true, length: { in: 3..250 }

  after_save :add_rating_to_product 

  private

  def add_rating_to_product

    rating = self.rating
    product = self.product

    total = 0

    product.reviews.each do |review| 
      total += review.rating
    end

    review_average = ((total.to_f/product.reviews.count) * 2.0).round / 2.0

    product.update({rating: review_average})

  end

end