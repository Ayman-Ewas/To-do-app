class PagesController < ApplicationController
  # skip_before_action :require_login, only: [:new]

  def new
    if logged_in?
      render :"tasks/index"

    else
      render :"pages/home"
    end
  end

  
end