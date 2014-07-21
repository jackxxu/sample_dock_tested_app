class Application

  include Newark

  before do
    headers['X-Newark-Version'] = Newark::VERSION
  end

  get '/api/text/:bar' do
    response.headers['Content-Type'] = 'text/plain'
    params[:bar]
  end

  get '/api/json/:bar' do
    response.headers['Content-Type'] = 'application/json'
    response.body = MultiJson.dump({bar: params[:bar]})
  end

  post '/api/json/:bar' do
    response.headers['Content-Type'] = 'application/json'
    response.body = MultiJson.dump({
      bar: params[:bar],
      foo: 1
    })
  end

end
