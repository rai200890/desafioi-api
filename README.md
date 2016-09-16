# sac-api

[![Build Status](https://travis-ci.org/rai200890/sac-api.svg?branch=improvement%2Fadd_travis_ci_config)](https://travis-ci.org/rai200890/sac-api)
[![Code Climate](https://codeclimate.com/github/rai200890/sac-api/badges/gpa.svg)](https://codeclimate.com/github/rai200890/sac-api)
[![Test Coverage](https://codeclimate.com/github/rai200890/sac-api/badges/coverage.svg)](https://codeclimate.com/github/rai200890/sac-api/coverage)

  Rails API to create and view issues

##Install

### OS Dependencies(Ubuntu)

```bash
make install-os-deps #install RVM, and other required os packages
```

####MYSQL
```bash
sudo apt-get update
sudo apt-get install -y mysql-server
```

###Project's dependencies(Using RVM)
```bash
  make setup-rvm #install rvm and create gemset
  make install #install project's dependencies in this gemset
  make setup-env #create .env file to load env var in development, make sure to change it before running setup
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
