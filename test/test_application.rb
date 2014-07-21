require 'test_helper'

class ApplicationTest < Minitest::Test
  include DockTest::Methods

  def test_text_get_response
    get '/api/text/sample_txt'
    assert_response_headers({"content-type"=>["text/plain"], "content-length"=>["10"], "connection"=>["Keep-Alive"]}, {exclude: ['server', 'x-newark-version', 'date']})
    assert_response_status 200
    assert_response_body 'sample_txt'
  end

  def test_json_get_response
    get '/api/json/sample_txt'
    assert_response_headers({"content-type"=>["application/json"], "connection"=>["Keep-Alive"]}, {exclude: ['server', 'content-length', 'x-newark-version', 'date']})
    assert_response_status 200
    assert_response_json_schema 'test/schemas/simple.schema.json'
  end

  def test_json_post_response
    post '/api/json/sample_txt'
    assert_response_headers({"content-type"=>["application/json"], "connection"=>["Keep-Alive"]}, {exclude: ['server', 'content-length', 'x-newark-version', 'date']})
    assert_response_status 200
    assert_response_json_schema 'test/schemas/complex.schema.json'
  end

end
