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
        @plants = Plant.all
        #@plants = Plant.find_by(@owner.id)
        erb :"owners/index"
    end

    get '/account/:id/edit' do
        @owner = current_owner
        erb :"owners/edit"
    end

    patch '/account/:id' do
        @owner = current_owner
        @owner.update(name: params[:name])
        # if params[:password] && params[:password] != @owner.password
        #     @owner.update(password: params[:password]) 
        # end
        @owner.save
        redirect '/account'
      end

    
end