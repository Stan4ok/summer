require 'rails_helper'
describe User do

  it "user without an email is not valid" do
    expect(User.new(email: nil, password: "aaaaaa")).not_to be_valid
  end

  it "user with an email without an '@' is not valid" do
    expect(User.new(email:"usergmail.com", password: "aaaaaa")).not_to be_valid
  end

  it "user with a psw<6 digits is not valid" do
    expect(User.new(email:"user@gmail.com", password: "aaaaa")).not_to be_valid
  end



end