FactoryGirl.define do
  factory :budget do
    sequence(:name) { |n| "Budget #{n}" }
    precision 2
  end
end
