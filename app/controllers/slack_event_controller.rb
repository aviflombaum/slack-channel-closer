class SlackEventController < ApplicationController

  post '/slack_event' do    
    request_body_params = JSON.parse(request.body.read)

    binding.pry
  end  

  get '/slack_event' do
    params[:challenge]
  end

end