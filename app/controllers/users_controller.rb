class UsersController < ApplicationController

  def show
    # presenter pattern
    # @user_show = UserPresenter(github_service, current_user)
    @followings         = github_service.following
    @followers          = github_service.follower
    @stars              = github_service.star
    @repos              = github_service.repo
    @orgs               = github_service.org
    @total              = github_service.total_commits(current_user)
    @longest            = github_service.longest_streak(current_user)
    @current            = github_service.current_streak(current_user)
    @following_activity = github_service.following_activity
    @commits            = github_service.recent_commits
  end

end
