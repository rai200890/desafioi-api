# sac-api

[![Build Status](https://travis-ci.org/rai200890/sac-api.svg?branch=improvement%2Fadd_travis_ci_config)](https://travis-ci.org/rai200890/sac-api)
[![Code Climate](https://codeclimate.com/github/rai200890/sac-api/badges/gpa.svg)](https://codeclimate.com/github/rai200890/sac-api)
[![Test Coverage](https://codeclimate.com/github/rai200890/sac-api/badges/coverage.svg)](https://codeclimate.com/github/rai200890/sac-api/coverage)

  Rails API to create and view issues

##Install

### OS Dependencies(Ubuntu)

####RVM
```bash
sudo apt-get install -y curl 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
```
####MYSQL
```bash
sudo apt-get update
sudo apt-get install -y mysql-server libmysqlclient-dev
```
###Project's dependencies(Using RVM)
```bash
  make setup-rvm #install rvm and create gemset
  make install #install project's dependencies in this gemset
  make setup-db #create database schema, run database migrations in development
```

##Run

```bash
  make run #run server at http://localhost:3000
```

##Docs

API Docs using Swagger 2.0 can be seen at: [http://localhost:3000/api-docs](http://localhost:3000/api-docs)

##Test

```bash
  make setup-test-db #create test database schema, run test database migrations
  make test #run project's unit tests
```
