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
    binding.pry
    @landmark = Landmark.create(params["landmark"])
     if !params[:landmark][:name].empty?
       @landmark.name = Landmark.create(name: params[:landmark][:name])
     end
     #
    #  if !params[:title][:name].empty?
    #    @landmark.titles << Title.create(params[:title])
    #  end

     @landmark.save

    redirect("/landmarks/#{@landmark.id}")
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    if !params[:landmark][:name].empty?
      @landmark.name = Landmark.create(name: params[:landmark][:name])
    end
    #
    # if !params[:title][:name].empty?
    #   @landmark.titles << Title.create(params[:title])
    # end

    @landmark.save

   redirect("/landmarks/#{@landmark.id}")
  end
end
