FactoryGirl.define do

  factory :product do
    name "Comet"
    description "Super Fast X-generation Dream"
    price "459"
    colour "Silver Black"
    image_url "comet.jpg"
  end

  factory :comment do
    rating "4"
    body "Not super fast though"
  end

end