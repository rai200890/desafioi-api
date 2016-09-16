setup-rvm: SHELL:=/bin/bash --login
setup-rvm:
	rvm install 2.3.1 #install ruby2.3.1 using rvm
	rvm use 2.3.1@sac-api --create #select ruby version and create gemset
	gem install bundler

setup-env:
	cp .env.sample .env #create .env file to load env var in development, make sure to change it before running setup

install-os-deps:
	sudo apt-get update
	sudo apt-get install -y curl libmysqlclient-dev
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable

install: #install project's dependencies
	bundle install

test: #run unit tests
	bundle exec rspec

setup-db: #create database schema and populate tables
	bundle exec rails db:create #create database schema
	bundle exec rails db:migrate #run database migrations
	bundle exec rails db:seed #populate tables(create states, issue types and issue reasons)

setup-test-db: #create test database schema
	rails db:create RAILS_ENV=test
	rails db:migrate RAILS_ENV=test

setup: install setup_db #setup project

run: #run server at http://localhost:3000
	rails s

ci: setup-test-db test
