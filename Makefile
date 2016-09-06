setup_rvm: SHELL:=/bin/bash --login
setup_rvm:
	rvm install 2.3.1 #install ruby2.3.1 using rvm
	rvm use 2.3.1@desafioi-api --create #select ruby version and create gemset
	gem install bundler

install: #install project's dependencies
	bundle install

test: #run unit tests
	rspec

setup_db: #create database schema and populate tables
	rake db:create #create database schema
	rake db:migrate #run database migrations
	rake db:seed #populate tables

setup_test_db: #create test database schema
	rake db:create RAILS_ENV=test
	rake db:migrate RAILS_ENV=test

setup: install setup_db #setup project

run: #run server at http://localhost:3000
	rails s

ci: setup_rvm install setup_test_db test
