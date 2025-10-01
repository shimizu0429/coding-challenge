FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app


#FROM ruby:3.1.2
#RUN apt-get update -qq && apt-get install -y \
#  build-essential \
#  libpq-dev \
#  nodejs \
#  yarn \
#  vim
#
## 作業ディレクトリ
#WORKDIR /app
## bundler を最新化（bundle not found 防止）
#RUN gem install bundler
## Gemfile を先にコピーして bundle install
#COPY Gemfile Gemfile.lock ./
#RUN bundle install
## アプリ全体をコピー
#COPY . .
## ポートを公開
#EXPOSE 3000
#ENV RAILS_ENV=production
#ENV RACK_ENV=production
## Rails サーバーを起動
#CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]