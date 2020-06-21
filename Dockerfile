FROM ruby:2.7.1
ENV APP_ROOT /app
WORKDIR $APP_ROOT
COPY Gemfile* $APP_ROOT/
ENV LANG ja_JP.UTF-8
RUN gem update --system &&\
    gem install bundler -v 2.1.4 &&\
    bundle config set path 'vendor/bundle' &&\
    bundle install
RUN apt update &&\
    apt -y --no-install-recommends install fonts-ipafont-gothic &&\
    wget -q -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y /tmp/google-chrome-stable_current_amd64.deb && \
    wget -q -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver_linux64.zip chromedriver -d /usr/local/bin/
