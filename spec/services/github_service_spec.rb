require 'rails_helper'

RSpec.describe "GitHub API", type: :request do

  it "returns a user's followers" do
    VCR.use_cassette("users_followers") do
      service = GithubService.new(user).follower

      expect(service.count).to eq(9)
    end
  end

end
