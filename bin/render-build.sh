#!/usr/bin/env bash

set -e

echo "-----> Installing dependencies"
bundle install --without development test --jobs 4 --retry 3

echo "-----> Precompiling assets"
RAILS_ENV=production bundle exec rails assets:precompile

echo "-----> Migrating database"
RAILS_ENV=production bundle exec rails db:migrate

echo "-----> Starting server"
bundle exec rails server -e production -p $PORT