class LevelsController < ApplicationController

  # # GET: /levels
  # get "/levels" do
  #   erb :"/levels/index.html"
  # end

  # GET: /levels/5
  get "/levels/:id" do
    if logged_in?
      @level = Level.find_by_id(params[:id])
        erb :"/levels/show"
    else  
      redirect "/gymnasts"
    end  
  end

  # # GET: /levels/5/edit
  # get "/levels/:id/edit" do
  #   erb :"/levels/edit.html"
  # end

  # # PATCH: /levels/5
  # patch "/levels/:id" do
  #   redirect "/levels/:id"
  # end

  # # DELETE: /levels/5/delete
  # delete "/levels/:id/delete" do
  #   redirect "/levels"
  # end
end
