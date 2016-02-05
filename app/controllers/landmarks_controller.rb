class LandmarksController < ApplicationController

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.new(name: params[:name], year_completed: params[:year_completed])
    @landmark.save
    redirect '/landmarks'
  end

   get '/landmarks' do 
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    Landmark.first
    erb :'landmarks/show'
  end


  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/edit'
  end


  post '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.name = params[:name] 
    @landmark.year_completed = params[:year_completed]
    @landmark.save
    erb :'/landmarks/show'
  end

  
end ## class end 
