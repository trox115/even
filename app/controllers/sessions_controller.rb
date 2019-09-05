# frozen_string_literal: true

class SessionsController < ApplicationController
before_action :not_logged_in, only: %i[new create]
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user

    else
      flash.now[:danger] = 'This user does not exist!'
      render 'new'
    end
  end

  def destroy
   log_out
   redirect_to root_path
  end

  private

end
