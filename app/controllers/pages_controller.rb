class PagesController < ApplicationController
  def home
  	@idea = current_user.ideas.build if logged_in?
  end
end
