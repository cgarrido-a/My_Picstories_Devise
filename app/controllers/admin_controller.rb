class AdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to admin_path, notice: 'User was successfully update'}
        format.json {render :show, status: :ok, locarion: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end
end
