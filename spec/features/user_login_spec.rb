require 'rails_helper'

RSpec.feature "user logs in", vcr: true do

  it "can log in to see user show page" do
    visit root_path
    click_link "Login with GitHub"

    expect(current_path).to eq(user_path)
    expect(page).to have_content("David Stinnette")
  end

end
