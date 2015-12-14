set :app_host, '120.26.72.23'

role :app, "deployer@#{fetch(:app_host)}"
role :web, "deployer@#{fetch(:app_host)}"
role :db,  "deployer@#{fetch(:app_host)}"

server fetch(:app_host), user: 'deployer', roles: %w{web app db}
