FROM ruby:3.3
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /rails-docker
# コンテナ内にmyappディレクトリを作成

WORKDIR /rails-docker
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /rails-docker/Gemfile
COPY Gemfile.lock /rails-docker/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /rails-docker
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー