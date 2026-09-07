class UsersController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user)
      redirect_to tasks_path, notice: "Welcome #{@user.username}!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to tasks_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account deleted successfully."
  end

  
  def form
    redirect_to new_user_path 
  end

  def password_digest_confirmation
    @user = User.find(params[:id])
    if @user.password_digest != @user.password_digest_confirmation
      redirect_to signup_path(@user), alert: "Password confirmation does not match."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :password_confirmation, :username)
  end
end