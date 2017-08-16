class SlackChannelImporter
  def initialize
    @client = SlackWrapper.new
  end

  def import
    @client.channels.each do |channel|
      import_channel(channel)
    end
  end

  def import_channel(channel)
    SlackChannel.find_or_create_by(:slack_id => channel["id"]) do |c|
      c.slack_name = channel["name"]
      c.private = channel["is_private"]
      c.topic = channel["topic"]["value"]
      c.purpose = channel["purpose"]["value"]
    end
  end
end