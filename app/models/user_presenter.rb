class UserPresenter
  attr_reader :github_service

  def initialize(github_service)
    @github_service = github_service
  end

  def following
    github_service.following
  end

  def follower
    github_service.follower
  end

  def star
    github_service.star
  end

  def repo
    github_service.repo
  end

  def org
    github_service.org
  end

  def total_commits(current_user)
    github_service.total_commits(current_user)
  end

  def longest_streak(current_user)
    github_service.longest_streak(current_user)
  end

  def current_streak(current_user)
    github_service.current_streak(current_user)
  end

  def community_activity
    github_service.community_activity
  end

  def recent_commits
    github_service.recent_commits
  end
end
