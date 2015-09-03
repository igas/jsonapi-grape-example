ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'rspec'
require File.expand_path('../../api', __FILE__)

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  it 'accepts application/vnd.api+json' do
    get '/', nil, 'HTTP_CONTENT_TYPE' => 'application/vnd.api+json'
    expect(last_response.status).to eq 200
  end
  it 'returns application/vnd.api+json' do
    get '/', nil, 'HTTP_CONTENT_TYPE' => 'application/vnd.api+json'
    expect(last_response.headers['Content-Type']).to eq 'application/vnd.api+json'
  end
  it 'does not accept empty content-type' do
    get '/'
    expect(last_response.status).to eq 406
  end
  it 'does not accept application/json' do
    get '/', nil, 'HTTP_CONTENT_TYPE' => 'application/json'
    expect(last_response.status).to eq 406
  end
end
