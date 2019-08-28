require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gym_starz_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_gym
    end
    
    def current_gym
      @current_gym ||= Gym.find_by(id: session[:gym_id]) if session[:gym_id]
    end  
  end
end
