class UsersController < ApplicationController
  respond_to :html, :js

  def update
  	@user = User.find(params[:id])
    name = @user.name
  end

 
end