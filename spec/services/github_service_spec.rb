require 'rails_helper'

RSpec.describe "GitHub API", type: :request do

  it "returns a user's followers" do
    VCR.use_cassette("users_followers") do
      service = GithubService.new(user).follower

      expect(service.count).to eq(9)
    end
  end

  it "returns users a user is following" do
    VCR.use_cassette("users_following") do
      service = GithubService.new(user).following

      expect(service.count).to eq(5)
    end
  end

  it "returns a user's stars" do
    VCR.use_cassette("users_stars") do
      service = GithubService.new(user).star

      expect(service.count).to eq(1)
    end
  end

  it "returns a user's repos" do
    VCR.use_cassette("users_repos") do
      service = GithubService.new(user).repo

      expect(service.count).to eq(30)
    end
  end

end
