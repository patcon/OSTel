# config valid only for Capistrano 3.1
lock '3.2.1'

app = 'ostn'

set :application, app
set :repo_url, 'https://github.com/patcon/OSTel.git'
set :branch, 'capistrano-deploy'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/deploy/#{app}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

## capistrano-rbenv
set :rbenv_custom_path, '/opt/rbenv'
set :rbenv_ruby, '1.9.3-p547'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :sudo, :service, :nginx, :reload
    end

    on roles(:app), in: :sequence, wait: 5 do
      # ?? :upgrade vs :restart ??
      # :upgrade needed when unicorn.rb changed
      # :restart has no downtime, since master process lives
      execute :sudo, :service, :unicorn_ostn, :upgrade
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
