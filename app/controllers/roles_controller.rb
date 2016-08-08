class RolesController < ApplicationController

  before_action :find_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.order(:name)
  end

  def show

  end

  def new
    @role = Role.new
  end

  def edit

  end

  def create
    @role = Role.new(role_params)

    @role.save ? redirect_to(@role) : render(:new)
  end

  def update
    @role.update(role_params) ? redirect_to(@role) : render(:edit)
  end

  def destroy
    if @role.destroy
      redirect_to queries_path, notice: 'Role successfully destroyed.'
    else
      redirect_to queries_path, flash: {error: 'Failed to destroy role.'}
    end
  end

  private

  def find_role
    begin
      @role = Role.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
