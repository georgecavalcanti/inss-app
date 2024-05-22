FROM ruby:3.3.0

ENV RAILS_ROOT /app

RUN mkdir -p $RAILS_ROOT

RUN gem install bundler -v 2.5.6

WORKDIR $RAILS_ROOT

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt-get install -y yarn

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install && \
		yarn install

COPY . ./

RUN rails assets:precompile

ENTRYPOINT ["/app/bin/docker-entrypoint"]