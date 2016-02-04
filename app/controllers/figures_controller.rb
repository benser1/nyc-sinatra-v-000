class FiguresController < ApplicationController

  get '/figures' do 
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end
  

  post '/figures' do 
    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids =params[:figure][:landmark_ids]
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save 
    redirect "figures/#{@figure.id}"
  end

  

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks = Landmark.find_or_create_by(params[:landmark])
    @figure.save 
    redirect '/figures/#{@figure.id}'
  end

end ## class end 
