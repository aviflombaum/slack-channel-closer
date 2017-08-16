class SlackWrapper
  attr_reader :client

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

  def delete_message(timestamp, channel)
    begin
      @client.chat_delete(:ts => timestamp, :channel => channel)
    rescue Slack::Web::Api::Errors::SlackError => e
      unless e.message == "message_not_found"
        raise e
      end
    end
  end

  def user_is_admin?(user_id)
    @client.users_info(:user => user_id).user.is_admin
  end

  def bot_dm(user, message)
    @client.chat_postMessage(:channel => user, :text => message, :as_user => false, :username => "flatironbot")
  end
end