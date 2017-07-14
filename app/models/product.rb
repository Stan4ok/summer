class Product < ApplicationRecord
  validates :name, presence: true 
  validates :price, numericality: { only_integer: true, message: "The price value must be an integer" }
	validates :image_url, format: /jpg/ 
    

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
