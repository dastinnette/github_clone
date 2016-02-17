class UsersController < ApplicationController

  def show
    # need to get info from people I follow
    # make an api request to github
    # store that info in a @var for view
    User.get_following(current_user)
    #FollowingService.call(current_user)
  end

end
