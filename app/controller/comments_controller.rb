class CommentsController < ApplicationController

    get '/plants/:plant_id/comment' do 
        @owner = current_owner
        @plant = Plant.find(params[:plant_id])
        erb :"comments/new"
    end

    post '/plants/:plant_id/comment' do
        @owner = current_owner
        @plant = Plant.find(params[:plant_id])
        @comment = Comment.create(plant_id: @plant.id, owner_id: @owner.id, reply: params[:reply])
        @comment.save
        redirect "/plants/#{@plant.id}"
    end

    get '/plants/:plant_id/comment/:id/edit' do 
        @owner = current_owner
        @plant = Plant.find(params[:plant_id])
        @comment = Comment.find(params[:id])
        erb :"/comments/edit"
    end

    patch '/plants/:plant_id/comment/:id/edit' do
        @plant = Plant.find(params[:plant_id]) 
        @comment = Comment.find(params[:id])
        @comment.update(params[:comment])
        @comment.save
        redirect "/plants/#{@plant.id}"
    end

    get '/plants/:plant_id/comment/:id/delete' do 
        @plant = Plant.find(params[:plant_id])
        @comment = Comment.find(params[:id])
        @comment.delete
        redirect "/plants/#{@plant.id}"
    end


end