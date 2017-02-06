# config valid only for current version of Capistrano
lock "3.7.2"

Dotenv.load

set :application, "remotemeetup"
set :repo_url, "https://github.com/remotemeetup/remotemeetup.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

server "67.159.12.102", roles: %w{app db web}, user: 'web'
set :ssh_options, {
      user: 'web',
      forward_agent: false,
      auth_methods: %w(publickey)
    }
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_files, ".env.production"

# ----- Rails stuff

set :conditionally_migrate, true
set :migration_role, :app
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :assets_roles, [:web, :app]

# ----- Web Server config

set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"

# set :puma_user, fetch(:user)
# set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_state, "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, -> { "unix://#{shared_path}/tmp/sockets/puma_#{fetch(:application)}_#{fetch(:stage)}.sock" }    #accept array for multi-bind
# set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
# set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, -> { "#{shared_path}/log/puma_access.log" }
set :puma_error_log, -> { "#{shared_path}/log/puma_error.log" }
# set :puma_role, :app
# set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [4, 16]
set :puma_workers, 0
# set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, true
# set :puma_plugins, []  #accept array of plugins
# set :nginx_use_ssl, false

# ----- Slack announces
set :slackistrano, {
  klass: Slackistrano::Pretty,
  channel: '#announces',
  team: 'remotemeetup',
  token: ENV["SLACK_TOKEN"]
}

# ----- Custom tasks
namespace :logs do
  desc "tail rails logs" 
  task :tail do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end
end
