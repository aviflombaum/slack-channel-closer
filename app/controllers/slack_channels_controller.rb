class SlackChannelsController < ApplicationController


  get '/' do
    @slack_channels = SlackChannel.all
    erb :"slack_channels/index"
  end

  patch '/slack_channels/:slack_id' do
    @slack_channel = SlackChannel.find_by(:slack_id => params[:slack_id])
    redirect "/slack_channels/#{@slack_channel.slack_id}"
  end

end