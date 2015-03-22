class UsersController < ApplicationController

	def show
	    @user = User.find(params[:id])
	    @ideas = @user.ideas
	end

	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	    	log_in @user
	    	flash[:success] = "Sign up successful!"
	      	redirect_to @user
	    else
	      	render 'new'
	    end
	end

	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User destroyed."
	    redirect_to users_url
	end

	private

	    def user_params
	      params.require(:user).permit(:name, :email, :password,
	                                   :password_confirmation)
	    end
end
