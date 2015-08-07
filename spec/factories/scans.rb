FactoryGirl.define do
  factory :scan do
    sequence(:content) { |n| "test_user#{n};test_user#{n}@gmail.com\n" }
  end
end
