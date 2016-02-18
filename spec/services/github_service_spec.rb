require 'rails_helper'

describe "GithubService" do
  context "#followers" do
    it "returns followers" do
      VCR.use_cassette("github_service#followers") do
        service = GithubService.new
        followers = service.followers

        expect(followers.count).to eq(9)
      end
    end
  end
end
