class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, presence: true, length: { in: 5..250 }

  after_save :add_rating_to_product 

  private

  def add_rating_to_product

    rating = self.rating
    product = self.product

    total = 0

    product.reviews.each do |review| 
      total += review.rating
    end

    review_average = (total/product.reviews.count).round(1)

    product.update({rating: review_average})

  end

end