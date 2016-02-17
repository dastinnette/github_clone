require 'net/http'
require 'json'

class GithubService
attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(url: "https://api.github.com")
    @connection.headers = {"Authorization" => "token #{current_user.token}"}
  end

  # def self.call(current_user)
  #   path = "https://api.github.com/#{current_user.nickname}/following?access_token=#{current_user.token}/"
  #   uri = URI(path)
  #   response = Net::HTTP.get_response(uri)
  #   JSON.parse(response.body)
  # end

  def following
    parse(connection.get("/users/#{current_user.nickname}/following"))
  end

  def follower
    parse(connection.get("/users/#{current_user.nickname}/followers"))
  end

  def star
    parse(connection.get("/users/#{current_user.nickname}/starred"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
