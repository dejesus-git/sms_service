class DashboardController < ApplicationController
	before_action :authentication
  def index
  	# @posts = @current_user.posts
  end

  def uploads
  end

  def account
  	@user = @current_user
  end

end
