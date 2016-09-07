setup-rvm: SHELL:=/bin/bash --login
setup-rvm:
	rvm install 2.3.1 #install ruby2.3.1 using rvm
	rvm use 2.3.1@desafioi-api --create #select ruby version and create gemset
	gem install bundler

install: #install project's dependencies
	bundle install

test: #run unit tests
	bundle exec rspec

setup-db: #create database schema and populate tables
	bundle exec rake db:create #create database schema
	bundle exec rake db:migrate #run database migrations
	bundle exec rake db:seed #populate tables

setup-test-db: #create test database schema
	bundle exec rake db:create RAILS_ENV=test
	bundle exec rake db:migrate RAILS_ENV=test

setup: install setup_db #setup project

run: #run server at http://localhost:3000
	rails s

ci: setup-test-db test
