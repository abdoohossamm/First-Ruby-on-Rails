#!/bin/sh
yarn install
bundle install
rails s -b 0.0.0.0 -p 3000