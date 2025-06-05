FROM ruby:2.7.6

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev nodejs

WORKDIR /app


COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.4.22
RUN bundle install

COPY . .

RUN mkdir -p tmp

CMD ["bash", "-c", "bundle exec rails db:create && db:migrate && bundle exec rails server -b 0.0.0.0"]
