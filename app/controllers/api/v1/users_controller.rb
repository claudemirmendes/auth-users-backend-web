module Api
  module V1
    class UsersController < PrivateController
    before_action :authenticate_admin!
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

    def create
      unless valid_role?(params[:role])
        render json: { error: 'Invalid role type' }, status: :unprocessable_entity
        return
      end
      @user = User.new(user_params)
      @user.add_role(params[:role]) if params[:role].present?
  
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def authenticate_admin!
      unless current_user && current_user.has_role?(:admin)
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
    private

    def valid_role?(role)

      valid_roles = ['admin', 'secretary', 'analyst', 'adminstrative','financial']


      valid_roles.include?(role)
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :role)
    end
  end
end
end