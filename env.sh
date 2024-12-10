alias rails="bundle exec rails"

bundle() {
  docker compose run -e RAILS_ENV=${RAILS_ENV:=development} --rm app bundle $*
}