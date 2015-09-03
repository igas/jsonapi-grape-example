require 'grape'
require 'oj'

class API < Grape::API
  content_type :jsonapi, "application/vnd.api+json"
  formatter :jsonapi, -> (object, _env) { Oj.dump(object) }
  # format :jsonapi

  get :/ do
    {
      jsonapi: {
        version: "1.0"
      }
    }
  end
end

run API
