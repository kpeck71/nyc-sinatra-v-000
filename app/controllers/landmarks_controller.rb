class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"]

    @landmark.save

    redirect("/landmarks/#{@landmark.id}")
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    if !params[:name].nil?
      @landmark.name = params[:name]
    end

    if !params[:year_completed].nil?
      @landmark.year_completed = params[:year_completed]
    end

    @landmark.save

   redirect("/landmarks/#{@landmark.id}")
  end
end
