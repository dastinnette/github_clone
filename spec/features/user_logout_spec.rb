require 'rails_helper'

RSpec.feature "user logs out", vcr: true do

  it "can log out to see root path" do
    visit root_path
    click_link "Login with GitHub"

    expect(current_path).to eq(user_path)
    expect(page).to have_content("David Stinnette")

    click_link "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to BitPub")
  end

end
