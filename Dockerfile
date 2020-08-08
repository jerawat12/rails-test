FROM ruby:2.5.0
WORKDIR /app
EXPOSE 3000
COPY Gemfile* ./
RUN gem install rails
RUN gem install bundle
RUN bundle install

COPY . ./
# Start the main process.
CMD ["rails", "server", "-e", "development"]
