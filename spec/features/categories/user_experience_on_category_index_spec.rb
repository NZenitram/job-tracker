require 'rails_helper'


describe "the category index page and actions" do
  scenario "a user can see categories available" do
    Category.create(title: "Developer")
    Category.create(title: "IT")

    visit categories_path

    expect(page).to have_content("Developer")
    expect(page).to have_content("IT")
  end

  scenario "a user can delete a category" do
    Category.create(title: "Developer")

    visit categories_path
    click_on("Delete")

    expect(page).to_not have_content("IT")
  end
  scenario "a user can delete a category" do
    Category.create(title: "Developer")

    visit categories_path
    click_on("Edit")
    fill_in "category[title]", with: "Dev"
    click_on("Update Category")

    expect(page).to have_content("Dev")
  end
end
