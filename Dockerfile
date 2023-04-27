FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs default-libmysqlclient-dev

RUN gem install bundler:2.2.28

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
