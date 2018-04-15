# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*',
    :headers => :any,
    :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
    :methods => [:get, :post, :options, :delete, :put]
  end
end
# config.middleware.insert_before 0, Rack::Cors do
#     allow do
#       origins '*'
#       resource '*', :headers => :any, :methods => [:get, :post, :options]
#     end
#   end
# Rails.application.config.middleware.use Rack::Cors do
#     allow do
#       origins '*'
#       resource '*',
#       :headers => :any,
#       :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
#       :methods => [:get, :post, :options, :delete, :put]
#     end
#   end

# The above allow all domains to contact our server, 
# expose some custom headers retuned by Devise Token Auth, 
# and allow the most commonly used http request methods, 
# although we won’t need all of them.