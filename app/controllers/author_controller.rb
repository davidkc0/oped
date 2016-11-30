class AuthorController < ApplicationController
	before_action :authenticate_author!, only: [:edit, :update]
	before_action :check_authorization, only: [:edit, :update]
	
	before_action :set_author
	

	def show

	end

	def edit
		# @author = Author.find(params[:id])

		# unless current_author.id == @author.id
		# 	redirect_to root_url
		# end
	end

	def update 
		if @author.update(author_params)
			redirect_to @author 
		else 
			flash.now[:alart] = "Something went wrong. Please try again."
			render :edit
		end
	end

	private

	def check_authorization 
		unless current_author.id == params[:id].to_i
			redirect_to root_url
		end
	end

	def set_author 
		@author = Author.find(params[:id])

	end

	def author_params
		params.require(:author).permit(:name, :avatar, :description)
	end
end