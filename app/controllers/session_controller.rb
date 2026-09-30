class SessionController < ApplicationController
    # skip_before_action :require_login, only: [:new, :create]

  def new
    
  end

  def create
    @user = User.find_by!(email: session_params[:email])

    password_valid = begin
      @user.authenticate(session_params[:password])
    rescue 
      false
    end
    
  

    if password_valid
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

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
