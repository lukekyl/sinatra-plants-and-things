class PlantsController < ApplicationController

    get '/plants' do
        @plants = Plant.all
        erb :"plants/index"
    end

    get '/plants/new' do 
        erb :"plants/new"
    end

    post '/plants' do
        @plant = Plant.create(name: params[:plant][:name])
        @owner = current_owner
        @plant.creator_id = @owner.id
        @plant.update(params[:plant])
        @ownerplant = OwnerPlant.create(plant_id: @plant.id, owner_id: @owner.id)
        redirect "/plants/#{@plant.id}"
    end

    post '/plants/:id/add_owner' do
        @plant = current_plant
        @owner = current_owner
        @ownerplant = OwnerPlant.create(plant_id: @plant.id, owner_id: @owner.id)
        redirect '/account'
    end

    get '/plants/:id/remove_owner' do
        @plant = current_plant
        @owner = current_owner
        @ownerplant = OwnerPlant.find_by(plant_id: @plant.id, owner_id: @owner.id)
        @ownerplant.delete 
        redirect '/account'
    end

    get '/plants/:id' do 
        @plant = current_plant
        @owner = current_owner
        @comments = @plant.comments
        erb :"plants/view"
    end

    get '/plants/:id/edit' do 
        @plant = current_plant
        erb :"plants/edit"
    end

    patch '/plants/:id' do 
        @plant = current_plant
        @plant.update(params[:plant])
        @plant.save
        redirect "/plants/#{@plant.id}"
    end

    get '/plants/:id/delete' do 
        @plant = current_plant
        @op = OwnerPlant.find_by(plant_id: @plant.id)
        @op.delete
        @plant.delete
        redirect "/plants"
    end

end