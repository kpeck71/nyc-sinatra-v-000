class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Figure.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @figure = Figure.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @figure = Figure.create(params["figure"])
     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save

    redirect("/landmarks/#{@figure.id}")
  end

  post '/landmarks/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

   redirect("/landmarks/#{@figure.id}")
  end
end
