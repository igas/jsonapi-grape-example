require 'grape'
require 'oj'

class API < Grape::API
  content_type :jsonapi, "application/vnd.api+json"
  formatter :jsonapi, -> (object, _env) { Oj.dump(object) }
  format :jsonapi

  before do
    error! 'Unsupported Content-Type', 406 unless headers['Content-Type'] == 'application/vnd.api+json'
  end

  get :/ do
    {
      jsonapi: {
        version: "1.0"
      }
    }
  end
end

