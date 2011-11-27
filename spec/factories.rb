FactoryGirl.define do
  factory :user do    
    sequence(:username) { |n| "millisami#{n}" }
    email { "#{username}@example.com" }
    password "secret"
    #admin false
    
    # factory :admin_user, :class => User do
    #   admin true
    # end
  end
end