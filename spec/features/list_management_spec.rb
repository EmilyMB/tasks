require "rails_helper"

RSpec.feature "ListManagement", type: :feature do
  scenario "User creates a new list" do
    visit "/lists/new"

    fill_in "list[title]", with: "My new list"
    click_button "Create"

    expect(page).to have_text("My new list")
  end

  scenario "User visits home page" do
    list1 = create(:list, title: "I'm the first")
    list2 = create(:list, title: "Second")
    10.times { list1.tasks << create(:task, list_id: list1.id) }

    visit root_path

    expect(page).to have_text("Task Master!")
    expect(page).to have_text("I'm the first")
    expect(page).to have_text("Second")
    within("#list-#{list1.id}") do
      expect(page).to have_css("li", count: 10)
    end
    within("#list-#{list2.id}") do
      expect(page).to have_css("li", count: 0)
    end
  end

  scenario "User visits home page and clicks new" do
    visit root_path

    click_link_or_button("New")

    expect(current_path).to eq(new_list_path)
  end
end
