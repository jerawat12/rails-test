FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN gem install bundle
RUN gem install rails

WORKDIR /app
COPY package.json yarn.lock ./
RUN sudo yarn install --check-files

EXPOSE 3000
COPY Gemfile* ./
RUN bundle install
COPY . ./

ENV PATH=./bin:$PATH
# Start the main process.
CMD ["rails", "server", "-e", "development"]
