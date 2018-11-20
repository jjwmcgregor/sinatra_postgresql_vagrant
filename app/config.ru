require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require_relative 'models/User.rb'
require_relative 'controllers/users_controller.rb'


use Rack::Reloader

use Rack::MethodOverride

run UserController
