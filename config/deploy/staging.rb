set :branch, 'master'
set :stage, :staging

# Setting RAILS_ENV environment variable on server
set :rails_env, :production

set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}

role :app, %w{ubuntu@3.16.37.85}

# Force rake through bundle exec
SSHKit.config.command_map[:rake] = "bundle exec rake"

# Force rails through bundle exec
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "sudo service apache2 restart"
    end
  end

  after :finishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
