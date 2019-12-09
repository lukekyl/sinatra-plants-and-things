class PlantsController < ApplicationController

    # get '/plants' do
    #     @plants = Plant.all
    #     erb :"plants/index"
    # end

    get '/plants/new' do 
        erb :"plants/new"
    end

    post '/plants' do
        @plant = Plant.create(name: params[:plant][:name])
        @plant.update(params[:plant])
        @owner = current_owner
        @plant.owner_id = @owner.id
        @plant.save
        redirect "/plants/#{@plant.id}"
    end

    get '/plants/:id' do 
        @plant = Plant.find(params[:id])
        @owner = current_owner
        @comments = Comment.all
        erb :"plants/view"
    end

    get '/plants/:id/edit' do 
        @plant = Plant.find(params[:id])
        erb :"plants/edit"
    end

    patch '/plants/:id' do 
        @plant = Plant.find(params[:id])
        @plant.update(params[:plant])
        @plant.save
        redirect "/plants/#{@plant.id}"
    end

end