class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "kylesinatrafinal"
    end

    get '/' do
        erb :index
    end


    helpers do 
        def logged_in?
            !!session[:email]
        end
        def login(email, password)
            owner = Owner.find_by(email: email)
            if owner && owner.authenticate(password)
                session[:owner_id] = owner.id
            else
                redirect '/failure'
            end
        end
        def logout!
            session.clear
        end
        def current_owner
            Owner.find(session[:owner_id])
        end
        def current_plant
            Plant.find(params[:id])
        end
    end

    private
    def owner_params
        { email: params[:email], password: params[:password] }
    end

end