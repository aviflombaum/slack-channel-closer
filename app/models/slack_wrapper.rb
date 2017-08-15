class SlackWrapper
  TOKEN = 'xoxp-216895812753-217562343909-227060679668-be0c4ed9ff24fe3c74c4af3ed22a7267'

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