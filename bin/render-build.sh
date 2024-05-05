#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate


# # addressesテーブルの削除
# bundle exec rails generate migration DropAddressesTable
# bundle exec rake db:migrate

# # ordersテーブルの削除
# bundle exec rails generate migration DropOrdersTable
# bundle exec rake db:migrate

# # itemsテーブルの削除
# bundle exec rails generate migration DropItemsTable
# bundle exec rake db:migrate