# specify RACK_ENV and RAILS_ENV separately so we can set RACK_ENV=none to suppress the default unicorn middleware
# stack in development - http://dave.is/unicorn.html
web: env RACK_ENV=$RACK_ENV RAILS_ENV=$RAILS_ENV bundle exec unicorn -p $PORT -c ./config/unicorn.rb
