class CommentsController < ApplicationController

    get '/plants/:id/new_comment' do 
        @owner = current_owner
        @plant = Plant.find(params[:id])
        erb :"comments/new"
    end

    post '/plants/:id/new_comment' do
        @owner = current_owner
        @plant = Plant.find(params[:id])
        @comment = Comment.create(plant_id: @plant.id, owner_id: @owner.id, reply: params[:reply])
        @comment.save
        redirect "/plants/#{@plant.id}"
    end

    get '/plants/:id/delete_comment' do 
        @comment = Comment.find_by()
        @comment.clear
        redirect "/plants/#{@plant.id}"
    end


end