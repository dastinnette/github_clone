require 'net/http'
require 'json'

class GithubService

  def self.call(current_user)
    path = "https://api.github.com/#{current_user.nickname}/following?access_token=#{current_user.token}/"
    uri = URI(path)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

end
