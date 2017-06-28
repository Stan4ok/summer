class StaticPagesController < ApplicationController
  def index
  	@products = Product.limit(3)
  end

  def landing_page
  	@featured_product = Product.first
  end
  
end
