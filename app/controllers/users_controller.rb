class UsersController < ApplicationController

  def show
    # presenter pattern
    # @user_show = UserPresenter(github_service, current_user)

    @followings = github_service.following
    @followers  = github_service.follower
    @stars      = github_service.star
    @repos      = github_service.repo
    @orgs       = github_service.org
  end

end
