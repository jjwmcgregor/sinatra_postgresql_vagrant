class UserController < Sinatra::Base

  configure :development do
      register Sinatra::Reloader
  end

  get "/" do
    "<h1>Welcome to Sinatra</h1>"
  end

  get "/users" do
    @users = User.all
    
    erb :'users/index'
  end

end
