class UsersController < ApplicationController

  def show
    @user_show = UserPresenter.new(github_service)
  end

  def community_feed_table_view
    # @community_feed.map do |obj|
    #   obj[:commits]
  end

end
