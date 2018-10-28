# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "demo"
set :repo_url, "git@github.com:harirelyon/demo.git"
set :scm, :git
set :deploy_to, "/var/www/demo"
set :format, :pretty
set :log_level, :debug
set :pty, true

append :linked_files, "config/database.yml"
append :linked_dirs, "bin", "log", "tmp/cache", "tmp/cache", "vendor/bundle", "tmp/sockets", "public/system"

set :stages, %w(staging production)
set :default_stage, "staging"
set :ssh_options, {:forward_agent => true,
	 :user=> "root",
   :keepalive => true,
   :keepalive_interval => 3000}
set :user, "root"
set :migration_role, 'app' # Defaults to 'db'
set :assets_roles, [:app] # Defaults to [:web]
set :keep_releases, 3
