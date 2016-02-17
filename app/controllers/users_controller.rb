class UsersController < ApplicationController

  def show
    github_service = GithubService.new(current_user)
    @followings = github_service.following
    @followers  = github_service.follower
    @stars      = github_service.star 
    # need to get info from people I follow
    # make an api request to github
    # store that info in a @var for view
    # User.get_following(current_user)
    #FollowingService.call(current_user)
  end

end
