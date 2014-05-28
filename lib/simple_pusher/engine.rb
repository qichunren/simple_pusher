module SimplePusher
  class Engine < ::Rails::Engine
    initializer "simple_pusher.configure_rails_initialization" do |app|
      app.middleware.use SimplePusher::Middleware
    end
  end
end
