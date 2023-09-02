module Api
  module V1
    class UsersController < PrivateController
    before_action :authenticate_admin, only: [:index, :show, :update, :destroy]
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
      render json: @user
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      head :no_content
    end
  
    private

  
    def user_params
      params.require(:user).permit(:email, :password, :role)
    end
    def authenticate_admin!
      unless current_user && current_user.has_role?(:admin)
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
end
end