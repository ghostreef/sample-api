class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:last_name)
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)

    @user.generate_api_key if params[:auto_generate_key] == '1' && @user.valid?

    @user.save ? redirect_to(@user) : render(:new)
  end

  def update
    @user.update(user_params) ? redirect_to(@user) : render(:edit)
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'User successfully destroyed.'
    else
      redirect_to users_path, flash: {error: 'Failed to destroy user.'}
    end
  end

  private

  def find_user
    begin
      @user = User.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
