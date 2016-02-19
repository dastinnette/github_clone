require 'rails_helper'

RSpec.describe "GitHub API", type: :request do
  attr_reader :service

  before do
    @service = GithubService.new(user)
  end

  it "returns a user's followers" do
    VCR.use_cassette("users_followers") do
      followers      = service.follower
      first_follower = followers.first

      expect(first_follower[:login]).to eq("mitchashby16")
      expect(service.follower.count).to eq(9)
    end
  end

  it "returns users a user is following" do
    VCR.use_cassette("users_following") do
      followings = service.following
      follow     = followings.first

      expect(follow[:login]).to eq("jcasimir")
      expect(service.following.count).to eq(5)
    end
  end

  it "returns a user's stars" do
    VCR.use_cassette("users_stars") do
      stars   = service.star
      starred = stars.first

      expect(starred[:name]).to eq("the_pivot")
      expect(service.star.count).to eq(1)
    end
  end

  it "returns a user's repos" do
    VCR.use_cassette("users_repos") do
      repos      = service.repo
      first_repo = repos.first

      expect(first_repo[:name]).to eq("posse_challenges")
      expect(service.repo.count).to eq(30)
    end
  end

  it "returns a user's organizations" do
    VCR.use_cassette("users_orgs") do
      orgs      = @service.org
      first_org = orgs.first

      expect(first_org[:login]).to eq("TuringTestOrganization")
      expect(service.org.count).to eq(1)
    end
  end

  it "returns a user's total commits" do
    VCR.use_cassette("users_total_commits") do
      service = @service.total_commits(user)

      expect(service).to eq(857)
    end
  end

  it "returns a user's current streak" do
    VCR.use_cassette("users_current_streak") do
      service = @service.current_streak(user)

      expect(service).to eq(4)
    end
  end

  it "returns a user's longest streak" do
    VCR.use_cassette("users_longest_streak") do
      service = @service.longest_streak(user)

      expect(service).to eq(11)
    end
  end

  # it "returns a list of the recent commits for the user" do
  #   VCR.use_cassette("github_service#recent_commits") do
  #     recent_commits = @service.recent_commits
  #     first_commit = recent_commits.first
  #
  #     expect(recent_commits.count).to eq(13)
  #     expect(first_commit).to eq("Started Omniauth-testing")
  #   end
  # end
  #
  # it "returns a list of followers and their recent commits" do
  #   VCR.use_cassette("github_service#following_activity") do
  #     all_activity = @service.following_activity
  #     last_following = all_activity.last
  #     commits = last_following[:commits]
  #
  #     expect(all_activity.count).to eq(7)
  #     expect(last_following[:nickname]).to eq("danjwinter")
  #     expect(commits.first).to eq("add rails 12 factor")
  #   end
  # end

end
