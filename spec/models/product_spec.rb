require 'rails_helper'
describe Product do
  
  context "when the product has comments" do
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end
    let(:product) {Product.create!(name: "race bike", price: 500, image_url: "123.jpg")}
    let(:user) {User.create!(first_name: "Shean", last_name: "Blue", email: "Shean@blue.com", password: "rfcrfc")}
    
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq (3)
    end      
  end


  context "when the product has comments" do
    let(:product) {Product.create!(name: "race bike", price: 500, image_url: "123.jpg")}
    let(:user) {User.create!(first_name: "Shean", last_name: "Blue", email: "Shean@blue.com", password: "rfcrfc")}
    
    it "returns the comment with a highest rating" do
      comment1 = product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      comment2 = product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      comment3 = product.comments.create!(rating: 5, user: user, body: "Great bike!")
      expect(product.highest_rating_comment).to eq (comment3)
    end      
  end


  context "when the product does not have a name" do
    let(:product) {Product.new(description: "nice bike")}

    it "is not valid without a name" do
      expect(Product.new(description: "nice bike")).not_to be_valid
    end
  end


end
