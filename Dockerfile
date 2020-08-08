FROM ruby:2.5.0
WORKDIR ./
COPY Gemfile* ./
RUN gem install rails
RUN gem install bundle
RUN bundle install

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-e", "development"]
