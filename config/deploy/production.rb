server "67.159.12.102"

set :user, "web"
set :roles, %w{app db web}
set :ssh_options, {
      user: 'web',
      forward_agent: false,
      auth_methods: %w(publickey)
    }

set :deploy_to, "/srv/production"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"


set :nginx_config_name, 'production'
set :nginx_server_name, 'remotemeetups.com'
set :puma_env, 'production'
