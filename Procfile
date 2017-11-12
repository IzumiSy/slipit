release: bundle exec rake db:migrate
worker: TERM_CHILD=1 QUEUES=* bundle exec rake environment resque:work
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
