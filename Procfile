release: rails db:migrate
worker: bundle exec sidekiq -C config/sidekiq.yml
web: bundle exec rails server
