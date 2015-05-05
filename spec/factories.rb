FactoryGirl.define do
  factory :list do
    sequence(:title) { |n| "List #{n}" }
  end

  factory :task do
    list
    sequence(:title) { |n| "Task #{n}" }
    description "I'm a task!"
    due_date 1.year.ago
  end
end
