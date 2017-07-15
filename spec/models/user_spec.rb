require 'rails_helper'
describe User, type: :model do

  it "user without an email is not valid" do
    expect(User.new(email: nil, password: "aaaaaa")).not_to be_valid
  end

  it "user with an email without an '@' is not valid" do
    user = FactoryGirl.build(:user, email: "user.com")
    expect(user).not_to be_valid
  end 

  it "user with a psw<6 digits is not valid" do
    user = FactoryGirl.build(:user, password: "12345")
    expect(user).not_to be_valid
  end


  it "should not validate users without an email address" do
    user = FactoryGirl.build(:user, email: "not_an_email")
    expect(user).to_not be_valid
  end

end