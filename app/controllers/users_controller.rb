class UsersController < ApplicationController

  def show
    raise "logging in".inspect
    redirect_to '/'
  end

end
