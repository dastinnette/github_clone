class GithubService
attr_reader :connection, :current_user, :stats

  def initialize(current_user)
    @current_user = current_user
    @connection   = Faraday.new(url: "https://api.github.com")
    @stats        = GithubStats.new(current_user.nickname)
  end

  def following
    parse(connection.get("/user/following", {access_token: current_user.token}))
  end

  def follower
    parse(connection.get("/user/followers", {access_token: current_user.token}))
  end

  def star
    parse(connection.get("/user/starred", {access_token: current_user.token}))
  end

  def repo
    parse(connection.get("/user/repos", {access_token: current_user.token}))
  end

  def org
    parse(connection.get("/users/#{current_user.nickname}/orgs", {access_token: current_user.token}))
  end

  def total_commits(current_user)
    stats.data.scores.reduce(:+)
  end

  def current_streak(current_user)
    stats.streak.count
  end

  def longest_streak(current_user)
    stats.longest_streak.count
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
