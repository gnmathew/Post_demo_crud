class UsersController < ApplicationController
  before_action :find_user
  @user = current_user
  @user.create_profile unless @user.profile

  def show; end

  def update
    if @user.update(user_params)
      flash[:notice] = "updated successfully"
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def find_user
    @user = current_user
    @user.create_profile unless @user.profile
  end


  def user_params
    params.require(:user).permit(:time_zone, profile_attributes: [:id, :legal_name, :birthday, :location, :education, :occupation, :bio, :specialty] )
  end

end
