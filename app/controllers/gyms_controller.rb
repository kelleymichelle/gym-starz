class GymsController < ApplicationController

  # GET: /gyms
  get "/signup" do
    if !logged_in?
      erb :"/gyms/new"
    else
      redirect "/gymnasts"
    # erb :"/gyms/index.html"
    end
  end

  post "/signup" do
    binding.pry
    if params[:name] == "" || params[:password] == ""
      redirect "/signup"
    else
      @gym = Gym.new(params)
      @gym.save
      session[:gym_id] = @gym.id
      redirect "/gymnasts"
    end    
  end  

  get "/login" do
    if !logged_in?
      erb :"/gyms/login"
    else
      redirect "/gymnasts"
    end    
  end  

  post "/login" do
    gym = Gym.find_by(:name => params[:name])
    if gym && gym.authenticate(params[:password])
      session[:gym_id] = gym.id
      redirect "/gymnasts"
    else 
      redirect "/signup"
    end   
  end 
  
  get "/logout" do
    if logged_in?
      session.destroy
      redirect "/login"
    else
      redirect "/"
    end    
  end  

end
