class GithubService
attr_reader :connection, :current_user, :stats, :token

  def initialize(current_user)
    @current_user = current_user
    @connection   = Faraday.new(url: "https://api.github.com")
    @stats        = GithubStats.new(current_user.nickname)
    @token        = {access_token: current_user.token}
  end

  def following
    parse(connection.get("/user/following", token))
  end

  def follower
    parse(connection.get("/user/followers", token))
  end

  def star
    parse(connection.get("/user/starred", token))
  end

  def repo
    parse(connection.get("/user/repos", token))
  end

  def org
    parse(connection.get("/users/#{current_user.nickname}/orgs", token))
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

  def recent_commits
    json_obj = parse(connection.get("/users/#{current_user.nickname}/events", token))
    parse_commit_messages(json_obj)
  end

  def community_activity
    nicknames.map do |nickname|
      json_obj = parse(connection.get("/users/#{nickname}/events", token))
      messages = parse_commit_messages(json_obj)
      {nickname: nickname, commits: messages[0..4]}
    end
  end

  private

  def nicknames
    nicknames = self.following.map { |people| people[:login] }
  end

  def parse_commit_messages(events)
    commit_events = events.select { |collection| collection[:type] == "PushEvent" }
    commit_events.map do |event|
      event[:payload][:commits].map do |commit|
        commit[:message]
      end
    end.flatten
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
