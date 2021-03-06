# frozen_string_literal: true

# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['http://localhost:3000', 'https://topclean-frontend.herokuapp.com']

    resource  '*',
              headers: :any,
              credentials: true,
              methods: %i[get post put patch delete options head]
  end
end
