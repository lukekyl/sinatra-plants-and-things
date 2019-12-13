class OwnersController < ApplicationController

    get '/signup' do
        erb :"owners/new"
    end

    post '/signup' do 
        owner = Owner.new(owner_params)
        if owner.save
            owner = login(owner.email, owner.password)
            redirect "/account/:id/edit"
        else
            redirect "/failure"
        end
    end

    get '/account' do
        @owner = current_owner
        @plants = @owner.plants
        erb :"owners/index"
    end

    get '/account/:id/edit' do
        @owner = current_owner
        erb :"owners/edit"
    end

    patch '/account/:id' do
        @owner = current_owner
        @owner.update(name: params[:name])
        @owner.save
        redirect '/account'
      end

    
end