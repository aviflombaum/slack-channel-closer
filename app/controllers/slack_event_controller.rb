class SlackEventController < ApplicationController

  post '/slack_event' do    
    request_body_params = JSON.parse(request.body.read)

    @slack_event = SlackEvent.new(request_body_params)
    @slack_event.process
  end  

  get '/slack_event' do
    params[:challenge]
  end

end