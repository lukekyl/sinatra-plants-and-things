class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        login(params[:email], params[:password])
        redirect '/account'
    end

    get '/logout' do
        logout!
        redirect '/'
    end

    get '/failure' do 
        erb :"sessions/failure"
    end

end