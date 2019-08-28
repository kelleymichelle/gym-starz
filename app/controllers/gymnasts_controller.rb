class GymnastsController < ApplicationController

  # GET: /gymnasts
  get "/gymnasts" do
    if logged_in?
      @gymnasts = Gymnast.all
      erb :"/gymnasts/index.html"
    else
      redirect "/login"  
    end  
  end

  # GET: /gymnasts/new
  get "/gymnasts/new" do
    erb :"/gymnasts/new.html"
  end

  # POST: /gymnasts
  post "/gymnasts" do
    redirect "/gymnasts"
  end

  # GET: /gymnasts/5
  get "/gymnasts/:id" do
    erb :"/gymnasts/show.html"
  end

  # GET: /gymnasts/5/edit
  get "/gymnasts/:id/edit" do
    erb :"/gymnasts/edit.html"
  end

  # PATCH: /gymnasts/5
  patch "/gymnasts/:id" do
    redirect "/gymnasts/:id"
  end

  # DELETE: /gymnasts/5/delete
  delete "/gymnasts/:id/delete" do
    redirect "/gymnasts"
  end
end
