require 'sinatra/base'

module SimplePusher
  class SinatraApp < Sinatra::Base

    post('/simple_pusher') do
      params[:channel].to_s.strip!
      if params[:channel].to_s.length == 0
       'Required channel param'
      else
        SimplePusher.publish(params[:channel], params[:message])
        'ok'
      end
    end
  end
end