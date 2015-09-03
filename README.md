* `bundle install`
* `rackup`
* `curl -I -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json" http://localhost:9292` - expect to works fine, got 406.
* Uncomment `format :jsonapi` in `config.ru`
* `curl -I -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json" http://localhost:9292` - works fine.
* `curl -I -H "Content-Type: text/plain" -H "Accept: text/plain" http://localhost:9292` - respond with `application/vnd.api+json`, expect to get 406.
