#!/usr/bin/env bash

bundle exec rails db:drop db:create db:migrate && bundle exec rails db:seed
bundle exec rails s -p 3000 -b '0.0.0.0'
