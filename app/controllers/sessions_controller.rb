class SessionsController < ApplicationController


    def index
    end

    def new
       
    end
 
    def create
        user = User.find_by(email: params[:user][:email]) 
        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to login_path
        end
    end

    def destroy
        if session[:user_id]
            session.delete(:user_id)
        else
            session.delete(:admin_id)
        end
        redirect_to '/'
    end

    def admin_new
       
    end
 
    def admin_create
        admin = Admin.find_by(email: params[:admin][:email]) 
        if admin && admin.authenticate(params[:admin][:password]) 
            session[:admin_id] = admin.id
            redirect_to admin
        else
            redirect_to admin_login_path
        end
    end

    def omniauth
     user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.password = SecureRandom.hex(12)
     end
     user.name = auth['info']['name']
     user.save
     session[:user_id] = user.id
     redirect_to user
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end