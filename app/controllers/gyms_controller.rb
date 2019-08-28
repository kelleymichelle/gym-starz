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

  # # GET: /gyms/new
  # get "/gyms/new" do
  #   erb :"/gyms/new.html"
  # end

  # # POST: /gyms
  # post "/gyms" do
  #   redirect "/gyms"
  # end

  # # GET: /gyms/5
  # get "/gyms/:id" do
  #   erb :"/gyms/show.html"
  # end

  # # GET: /gyms/5/edit
  # get "/gyms/:id/edit" do
  #   erb :"/gyms/edit.html"
  # end

  # # PATCH: /gyms/5
  # patch "/gyms/:id" do
  #   redirect "/gyms/:id"
  # end

  # # DELETE: /gyms/5/delete
  # delete "/gyms/:id/delete" do
  #   redirect "/gyms"
  # end
end
