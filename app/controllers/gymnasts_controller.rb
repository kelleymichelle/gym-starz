class GymnastsController < ApplicationController

  get "/gymnasts" do
    if logged_in?
      @gymnasts = Gymnast.all
      erb :"/gymnasts/index"
    else
      redirect "/login"  
    end  
  end

  get "/gymnasts/new" do
    # binding.pry
    erb :"/gymnasts/new"
  end

  # POST: /gymnasts
  post "/gymnasts" do
    if logged_in?
      if params[:name] == ""
        redirect "/gymnasts/new"
      else
        @gymnast =  Gymnast.create(params)
        @gymnast.gym_id = current_gym.id
        if @gymnast.save
          redirect "/gymnasts/#{@gymnast.id}"
        else  
          redirect "/gymnasts/new"
        end
      end
    else
      redirect "/login"
    end
  end

  # GET: /gymnasts/5
  get "/gymnasts/:id" do
    # binding.pry
    if logged_in?
      @gymnast = Gymnast.find_by_id(params[:id])
      erb :"/gymnasts/show"
    else
      redirect "/login"
    end  
  end

  # GET: /gymnasts/5/edit
  get "/gymnasts/:gymnast_id/levels" do
    
    "Edit Gymnast here!"
    erb :"/gymnasts/edit"
  end
  #gynasts/gymnast_id/levels/level_id/edit

  # # PATCH: /gymnasts/5
  # patch "/gymnasts/:id" do
  #   redirect "/gymnasts/:id"
  # end

  # # DELETE: /gymnasts/5/delete
  # delete "/gymnasts/:id/delete" do
  #   redirect "/gymnasts"
  # end
end
