# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ember_deploy_app'
set :repo_url,    'https://github.com/he9qi/ember_deploy_app.git'
set :branch,      'master'
set :deploy_to,   '/home/deployer/apps/main_app'
set :deploy_via,  :remote_cache
set :pty,         true
set :use_sudo,    false

set :linked_files, ['Procfile',
                    '.env',
                    '.rbenv-vars']

set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets}

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'

namespace :foreman do
  desc "Start the application services"
  task :start do
    on roles(:app), in: :sequence do
      cmd = %w(sudo service ember_deploy_app start)
      execute *cmd
    end
  end

  desc 'Regenerate init file'
  task :export do
    on roles(:app), in: :sequence do
      within current_path do
        cmd = %w(rbenv sudo foreman export upstart /etc/init -a ember_deploy_app -u deployer -l /var/ember_deploy_app/log)
        execute *cmd
      end
    end
  end
  before :start, :export

  desc "Stop the application services"
  task :stop do
    on roles(:app), in: :sequence do
      cmd = %w(sudo service ember_deploy_app stop)
      execute *cmd
    end
  end
end

