class FiguresController < ApplicationController

  get '/figures' do 
     erb :'/figures/index'
   end
 
   get '/figures/new' do 
      erb :'/figures/new'
   end 
 
   post '/figures' do 
     @figure = Figure.find_or_create_by(:name => params[:figure][:name])
     @figure.landmark_ids = params[:figure][:landmark_ids]
     @figure.title_ids = params[:figure][:title_ids]
     @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
     @figure.titles << Title.find_or_create_by(name: params[:title][:name])
     @figure.save
     erb :'/figures/show'
   end
 
   get '/figures/:id' do
     @figure = Figure.find_by(id: params[:id])
     Figure.first 
     erb :'/figures/show' 
   end
 
   get '/figures/:id/edit' do 
     @figure = Figure.find_by(id: params[:id])
     erb :'/figures/edit'
   end
 
   post '/figures/:id' do 
     @figure = Figure.find_by(id: params[:id])
     @figure.name = params[:figure][:name]
     @figure.title_ids = params[:figure][:title_ids]
     @figure.landmark_ids = params[:figure][:landmark_ids]
     @figure.titles << Title.find_or_create_by(name: params[:title][:name])
     @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
     @figure.save
     erb :'/figures/show'
 
   end 

end ## class end 
