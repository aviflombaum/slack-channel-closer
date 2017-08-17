class SlackEventController < ApplicationController

  post '/slack_event' do    
    request_body_params = JSON.parse(request.body.read)
    if request_body_params["challenge"]
      request_body_params["challenge"]
    else
      @slack_event = SlackEvent.new(request_body_params)
      @slack_event.process
      200 
    end
  end  

end