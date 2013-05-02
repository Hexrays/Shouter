class ShoutsController < ApplicationController

	def index
  	@shout = Shout.all
	end

  def show
  	@shout = Shout.find(params[:id])
  end

  def new
  	@shout = Shout.new
  	@all_shouts = Shout.all
  end

	def create
		# puts "***********************"
		# puts params[:user]
		# puts "***********************"
		@shout = Shout.new(params[:shout])
  	# @new_shout = Shout.new

		if @shout.save
			flash[:success] = "Yay it worked!"
			redirect_to new_shout_path
		else
			flash.now[:error] = "Sorry! You cannot shout."
			redirect_to new_shout_path
		end
	end

  def edit
  end

  def update
  end

  def destroy
  end
end
