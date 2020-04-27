FROM ruby:2.5.1

ENV ENTRYKIT_VERSION 0.4.0

RUN apt-get update \
  && apt-get install \
       openssl \
  && rm -rf /var/cache/apk/* \
  && wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink \
  && apt-get install -y \
       build-essential \
       nodejs

RUN mkdir /umbrellanotice
WORKDIR /umbrellanotice
ADD Gemfile /umbrellanotice/Gemfile
ADD Gemfile.lock /umbrellanotice/Gemfile.lock
RUN bundle install
ADD . /umbrellanotice

ENTRYPOINT [ \
  "prehook", "bundle install", "--", \
  "prehook", "echo sleep 20 seconds for mysql Start Up Comprete", "--", \
  "prehook", "sleep 20", "--", \
  "prehook", "echo finish sleep", "--", \
  "prehook", "bundle exec rails db:create", "--", \
  "prehook", "bundle exec unicorn_rails -c /umbrellanotice/config/unicorn.rb -E development", "--" \
]