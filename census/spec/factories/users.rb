FactoryGirl.define do
  factory :user do
    name 'pkrawat'
    email 'pankaj@example.com'
    password 'password'
    password_confirmation 'password'
  end
  factory :normal do
    name 'normal'
    email 'normal@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
