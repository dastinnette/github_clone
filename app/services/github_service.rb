class GithubService
attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(url: "https://api.github.com")
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

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
