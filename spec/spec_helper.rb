require 'simplecov'
SimpleCov.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def user
    @user ||= User.create(provider: 'github',
                          uid: '10576647',
                          email: 'dastinnette@gmail.com',
                          nickname: 'dastinnette',
                          name: 'David Stinnette',
                          image_url: 'http://viraltrendingnews.com/wp-content/uploads/2015/01/14207265577372-50-reasons-why-nicolas-cage-is-the-greatest-human-1-5571-1389124720-1_big.jpg',
                          token: ENV['GITHUB_USER_TOKEN'])
  end

  def login
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = Omniauth::AuthHash.new({
      :provider    =>   'github',
      :uid         =>   '10576647',
      :info        =>   {nickname:  'dastinnette',
                         name:      'David Stinnette',
                         image_url: 'http://viraltrendingnews.com/wp-content/uploads/2015/01/14207265577372-50-reasons-why-nicolas-cage-is-the-greatest-human-1-5571-1389124720-1_big.jpg',
                         email:     'dastinnette@gmail.com'},
      :credentials =>   {token: 'abc123'}
    })
  end
end
