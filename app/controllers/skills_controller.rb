class SkillsController < ApplicationController

  # GET: /skills
  get "/skills" do
    erb :"/skills/index.html"
  end

  # GET: /skills/new
  get "/skills/new" do
    erb :"/skills/new.html"
  end

  # POST: /skills
  post "/skills" do
    redirect "/skills"
  end

  # GET: /skills/5
  get "/skills/:id" do
    erb :"/skills/show.html"
  end

  # GET: /skills/5/edit
  get "/skills/:id/edit" do
    erb :"/skills/edit.html"
  end

  # PATCH: /skills/5
  patch "/skills/:id" do
    redirect "/skills/:id"
  end

  # DELETE: /skills/5/delete
  delete "/skills/:id/delete" do
    redirect "/skills"
  end
end
