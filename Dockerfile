FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql
RUN mkdir /sqlhunt
WORKDIR /sqlhunt
COPY Gemfile /sqlhunt/Gemfile
COPY Gemfile.lock /sqlhunt/Gemfile.lock
RUN bundle install
COPY . /sqlhunt
ENTRYPOINT [ "./entrypoint.sh" ]
