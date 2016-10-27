require 'rails_helper'

describe "the category index page and actions" do
  scenario "a user can edit categories available" do
    Category.create(title: "Developer")

    visit categories_path
    click_on("Edit")
    fill_in "category[title]", with: "Service"
    click_on("Update Category")

    expect(page).to have_content("Service")
  end
end
