# frozen_string_literal: true

class SessionsController < ApplicationController
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

  def destroy; end

  private

end
