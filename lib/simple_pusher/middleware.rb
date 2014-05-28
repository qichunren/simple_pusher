module SimplePusher
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/simple_pusher' && env['REQUEST_METHOD'] == 'POST'
        # Both support param from url query string and form post data
        simple_pusher_params = env['rack.request.form_hash'].present? ? env['rack.request.form_hash'] : Rack::Utils.parse_nested_query(env['QUERY_STRING'])
        if simple_pusher_params['channel'].blank?
          [200, {}, 'Required channel param']
        else
          SimplePusher.publish(simple_pusher_params['channel'], simple_pusher_params['message'])
          [200, {}, 'OK']
        end
      else
        @app.call(env)
      end
    end
  end
end