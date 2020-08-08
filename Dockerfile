FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
#RUN yarn install
WORKDIR /app
EXPOSE 3000
COPY Gemfile* ./
RUN gem install rails
RUN gem install bundle
RUN bundle install

COPY . ./
# Start the main process.
CMD ["rails", "server", "-e", "development"]
