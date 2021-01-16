class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:error]
            render :new
        end
    end

    def show
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit!
    end
end
