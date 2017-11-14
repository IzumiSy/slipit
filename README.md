# Slip.it

[![HoundCI](https://img.shields.io/badge/Protected_by-Hound-a873d1.svg)]
[![Dependency Status](https://gemnasium.com/badges/github.com/IzumiSy/slipit.svg)](https://gemnasium.com/github.com/IzumiSy/slipit)

![Applogo](https://user-images.githubusercontent.com/982850/32491371-ccdc9c72-c3f9-11e7-8636-4737533b7439.png)

> Slip.it is a small self-hostable bookmark webapp built with Ruby on Rails.  

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

## Setup
```sh
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

### Run
```sh
$ bundle exec rails dev:cache
$ bundle exec rails s
```

#### Worker
```sh
$ TERM_CHILD=1 QUEUES=* bundle exec rake environment resque:work
```

## Contribution
PRs accepted.
