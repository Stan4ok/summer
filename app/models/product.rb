class Product < ApplicationRecord
  validates :name, :description, :price, presence: true 
  validates :name, uniqueness: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: " value must be an integer" }
#	validates :image_url, format: /jpg/
  validates :image_url, allow_blank: true, format: {
      with: %r{\A[A-Za-z0-9._-]+\.(gif|jpg|png)\z}i,
      message: 'should point to a valid image format.'
  }

  has_many :orders
  has_many :comments
	if Rails.env.development?
		def self.search(search_term)
  		Product.where("name LIKE ?", "%#{search_term}%")
		end
	else
		def self.search(search_term)
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end
end

