require 'rails_helper'
describe Comment do


  context "there is no rating" do
    it "is not valid" do
      comment = FactoryGirl.build(:comment, rating: nil)
      expect(comment).not_to be_valid
    end
  end

  context "the body is empty" do
    it "is not valid" do
      expect(Comment.new(body: "")).not_to be_valid
    end
  end


end

# => this one does not work  
# => context "when the comment does not have a rating" do
#    let(:product) {Product.create!(name: "race bike", price: 500, image_url: "123.jpg")}
#    let(:user) {User.create!(first_name: "Shean", last_name: "Blue", email: "Shean@blue.com", password: "rfcrfc")}
    
#    it "is not valid without a rating" do
#      comment1 = product.comments.new(user: user, body: "Ok bike!")
#      expect (comment1).not_to be_valid
#    end
#  end
