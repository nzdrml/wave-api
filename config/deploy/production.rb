set :branch, :production
set :stage, :production

role :app, %w{deployuser@128.199.232.120}
role :web, %w{deployuser@128.199.232.120}
role :db,  %w{deployuser@128.199.232.120}
