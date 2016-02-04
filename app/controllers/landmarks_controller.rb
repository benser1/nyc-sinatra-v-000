class LandmarksController < ApplicationController

  get '/landmarks' do 
    erb :index
  end

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  post '/landmarks' do 
    @landmark = Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @landmark.save
    redirect '/landmarks/#{@landmark.id}'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :edit 
  end
end ## class end 
