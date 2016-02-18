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

  it "returns a user's total commits" do
    VCR.use_cassette("users_total_commits") do
      service = GithubService.new(user).find_user_total_commits(user)

      expect(service).to eq(856)
    end
  end

  it "returns a user's current streak" do
    VCR.use_cassette("users_current_streak") do
      service = GithubService.new(user).find_user_current_streak(user)

      expect(service).to eq(4)
    end
  end

  it "returns a user's longest streak" do
    VCR.use_cassette("users_longest_streak") do
      service = GithubService.new(user).find_user_longest_streak(user)

      expect(service).to eq(11)
    end
  end

  it "returns a user's organizations" do
    VCR.use_cassette("users_orgs") do
      service = GithubService.new(user).org

      expect(service.count).to eq(0)
    end
  end
end
