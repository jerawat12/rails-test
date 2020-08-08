FROM ruby:2.5.0
#RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile* ./
#COPY .env.example .env
#RUN gem install bundle
#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
#RUN rails db:setup
#RUN rails db:migrate
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

#RUN bundle exec rake assets:precompile
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN rails db:setup
RUN rails db:migrate
