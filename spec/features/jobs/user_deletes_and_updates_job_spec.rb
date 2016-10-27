require 'rails_helper'

describe "a user can delete and update a job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_jobs_path(company)
    click_on "Developer"
    click_on "Delete"

    expect(page).to_not have_content("Developer")
  end

  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_jobs_path(company)
    click_on "Developer"
    click_on "Edit"
    fill_in "job[title]", with: "Caster"
    click_on "Update Job"

    expect(page).to have_content("Caster")
  end
end
