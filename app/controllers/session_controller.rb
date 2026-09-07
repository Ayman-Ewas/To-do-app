class SessionController < ApplicationController
    # skip_before_action :require_login, only: [:new, :create]

  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      
      redirect_to tasks_path, notice: "Logged in successfully."
      
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully."
  end


end
