# Base image:
FROM ruby:2.3.1
 
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
 
# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /opts/wblog/sample_rails_docker_app
RUN mkdir -p $RAILS_ROOT
 
# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT
 
# Gems:
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
 
COPY config/puma.rb config/puma.rb
 
# Copy the main application.
COPY . .
 
EXPOSE 3000

RUN ASSETS_PRECOMPILE=true bundle exec rake assets:precompile
# The default command that gets ran will be to start the Puma server.
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
