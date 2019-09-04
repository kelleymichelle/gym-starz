class GymnastsController < ApplicationController

  get "/gymnasts" do
    if logged_in?
      # binding.pry
      @gymnasts = Gymnast.where("gym_id = ?", current_gym.id)
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
  #gynasts/gymnast_id/levels/level_id/edit

  get "/gymnasts/:gymnast_id/levels/:level_id/edit" do
    # raise params.inspect
    @gymnast = Gymnast.find_by_id(params[:gymnast_id])
    if logged_in? && @gymnast.gym_id == current_gym.id
      @level = Level.find_by_id(params[:level_id])
      @skills = Skill.where("level_id=?", @level.gym_level)
      erb :"gymnasts/edit"
    else
      redirect "/login"  
    end  
  end  

  # gymnast[skills] = skill_ids, gymnast_id, level_id
  patch "/gymnasts/:gymnast_id/levels/:level_id" do
    if logged_in?
      @level = Level.find_by_id(params[:level_id])
      @gymnast = Gymnast.find_by_id(params[:gymnast_id])
      # @skills_arr = params[:gymnast][:skills]
      
      if params[:gymnast][:skills] == ""
        redirect "/gymnasts/#{@gymnast.id}"
      else  
        # @level = Level.find_by_id(params[:level_id])
        # @gymnast = Gymnast.find_by_id(params[:gymnast_id])
        @skills_arr = params[:gymnast][:skills]
        # binding.pry
        # @gymnast.skills.where("level_id = ?", @level.gym_level).delete_all
        @skills_arr.each do |skill|
          new_skill = Skill.find_by_id(skill)
          # binding.pry
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
