require 'rails_helper'

feature "statusupdate" do

  scenario "Can load a valid status, show it, edit it and delete it" do
    visit statusupdates_path
    expect(page).to have_no_content("Bob")
    expect(page).to have_no_content("Happy")
    expect(page).to have_no_content("9")
    click_on "New Status"

    fill_in "Status", with: "Happy"
    fill_in "User", with: "Bob"
    fill_in "Number", with: 9
    click_on "Create Statusupdate"
    expect(page).to have_content("Bob")
    expect(page).to have_content("Happy")
    expect(page).to have_content("9")

    click_on "show"
    expect(page).to have_content("Your status:")
    expect(page).to have_content("User Name:")
    expect(page).to have_content("Your number:")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Happy")
    expect(page).to have_content("9")

    visit statusupdates_path
    click_on "edit"
    fill_in "Status", with: "Sad"
    click_on "Update Statusupdate"
    expect(page).to have_content("Bob")
    expect(page).to have_no_content("Happy")
    expect(page).to have_content("Sad")
    expect(page).to have_content("9")
    click_on "destroy"
    expect(page).to have_no_content("Bob")
    expect(page).to have_no_content("Sad")
    expect(page).to have_no_content("9")

    visit statusupdates_path
    click_on "New Status"
    click_on "Create Statusupdate"
    expect(page).to have_content("Status can't be blank")
    expect(page).to have_content("User can't be blank")
    expect(page).to have_content("Number can't be blank")


  end

  scenario "notices show up when created" do
    visit statusupdates_path
    expect(page).to have_no_content("Bob")
    expect(page).to have_no_content("Happy")
    expect(page).to have_no_content("9")
    click_on "New Status"

    fill_in "Status", with: "Happy"
    fill_in "User", with: "Bob"
    fill_in "Number", with: 9
    click_on "Create Statusupdate"
    expect(page).to have_content("Status Created!")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Happy")
    expect(page).to have_content("9")

    click_on "edit"
    fill_in "User", with: "Billy"
    click_on "Update Statusupdate"
    expect(page).to have_content("Status Updated!")
    click_on "destroy"
    expect(page).to have_content("Status Deleted!")


  end


end
