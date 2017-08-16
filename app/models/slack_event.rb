class SlackEvent
  def initialize(data)
    @data = data
  end

  def process
    event_type_processor.new(@data).process
  end

  def event_type_processor
    Kernel.const_get("SlackEvent::#{event_type.capitalize}")
  end

  def event_type
    @data["event"]["type"]
  end
end

class SlackEvent::Message
  def initialize(data)
    @data = data
  end

  def process
    slack_channel = SlackChannel.find_by(:slack_id => event_channel)
    process_closed_message if slack_channel.closed?
  end

  def process_closed_message
    unless client.user_is_admin?(sender_user_slack_id)
      client.delete_message(event_ts, event_channel) 
      client.bot_dm(sender_user_slack_id, "You tried posting to a closed channel.")        
    end
  end

  def event_ts
    @data["event"]["ts"]
  end

  def event_channel
    @data["event"]["channel"]
  end

  def sender_user_slack_id
    @data["event"]["user"]
    binding.pry unless @data["event"]["user"]
  end

  def client
    @client ||= SlackWrapper.new
  end
end