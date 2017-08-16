class SlackWrapper
  TOKEN = ENV["SLACK_TOKEN"]

  def initialize(token = nil)
    @token = token || TOKEN
    @client = Slack::Web::Client.new(:token => @token)
  end

  def channels
    [
      @client.channels_list['channels'],
      @client.groups_list['groups']
    ].flatten
  end
end