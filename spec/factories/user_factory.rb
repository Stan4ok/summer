FactoryGirl.define do
  sequence(:email) { |n| "facgirl#{n}@example.com" }

  factory :user do
    email 
    password "223456"
    first_name "Peter"
    last_name "Woods"
    admin false
  end

  factory :admin, class: User do
    email "dieter@yahoo.com"
    password "qwertyuiop"
    admin true
    first_name "Admin"
    last_name "User"
  end



end