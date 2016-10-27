require 'rails_helper'

describe "user can create a new category" do
  scenario "user creates a new category" do

    visit new_category_path
    fill_in "category[title]", with: "Dev"
    click_on "Create Category"

    expect(page).to have_content("Dev")
  end

  scenario "a user can see his category after it is created" do

    visit new_category_path
    fill_in "category[title]", with: "Dev"
    click_on "Create Category"

    expect(page).to have_content("Dev")
  end

  scenario "a user is redirected to create page if
            they try to create duplicate categories" do

    visit new_category_path
    fill_in "category[title]", with: "Dev"
    click_on "Create Category"
    visit new_category_path
    fill_in "category[title]", with: "Dev"

    expect(page).to have_content("Create a new Category")
  end
end
