class GymnastsController < ApplicationController

  get "/gymnasts" do
    if logged_in?
      # @gymnasts = Gymnast.where("gym_id = ?", current_gym.id)
      @gymnasts = current_gym.gymnasts
      erb :"/gymnasts/index"
    else
      redirect "/login"  
    end  
  end

  get "/gymnasts/new" do
    erb :"/gymnasts/new"
  end

  post "/gymnasts" do
    if logged_in?
      # if params[:name] == ""
      #   erb :"/gymnasts/new"
        # redirect "/gymnasts/new"
      
      @gymnast =  current_gym.gymnasts.build(params)
      # @gymnast.gym_id = current_gym.id
      if @gymnast.save
        redirect "/gymnasts/#{@gymnast.id}"
      else
        erb :"/gymnasts/new"  
        # redirect "/gymnasts/new"
      end
    
    else
      redirect "/login"
    end
  end

  get "/gymnasts/:id" do
    @gymnast = Gymnast.find_by_id(params[:id])

    if logged_in? && @gymnast.gym_id == current_gym.id
      erb :"/gymnasts/show"
    else
      redirect "/login"
    end  
  end

  get "/gymnasts/:gymnast_id/levels" do
    @gymnast = Gymnast.find_by_id(params[:gymnast_id])
    if logged_in? && @gymnast.gym_id == current_gym.id
      erb :"/gymnasts/levels"
    else
      redirect "/login"
    end    
  end

  get "/gymnasts/:gymnast_id/levels/:level_id/edit" do
    @gymnast = Gymnast.find_by_id(params[:gymnast_id])
    if logged_in? && @gymnast.gym_id == current_gym.id
      @level = Level.find_by_id(params[:level_id])
      @skills = Skill.where("level_id=?", @level.gym_level)
      erb :"gymnasts/edit"
    else
      redirect "/login"  
    end  
  end  

  patch "/gymnasts/:gymnast_id/levels/:level_id" do
    if logged_in?
      @level = Level.find_by_id(params[:level_id])
      @gymnast = Gymnast.find_by_id(params[:gymnast_id])
      
      if params[:gymnast][:skills] == ""
        redirect "/gymnasts/#{@gymnast.id}"
      else  
        @skills_arr = params[:gymnast][:skills]
        @skills_arr.each do |skill|
          new_skill = Skill.find_by_id(skill)
          if @gymnast.skills.include?(new_skill) == false
            @gymnast.skills.push(new_skill)
            @gymnast.save
          end
        end
      end
    end    
    redirect "/gymnasts/#{@gymnast.id}"
  end

  delete "/gymnasts/:id/delete" do
    if logged_in?
      @gymnast = Gymnast.find_by_id(params[:id])
      if @gymnast.gym_id == current_gym.id 
        @gymnast.destroy
      end  
        redirect "/gymnasts"
    else
      redirect "/login"
    end      
  end


end
