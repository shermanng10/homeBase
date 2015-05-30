class RewardsController < ApplicationController
	before_action :require_login
	def index
		rewards = Reward.where(family_id: current_user.id)
		render json: rewards
	end

	def create
		@reward = Reward.new(reward_params)
		@reward.family_id = current_user.id
		render json: @reward
	end


	def update
		reward = Reward.find_by(id: params[:id])
		if reward.update_attributes(reward_params)
			flash[:success] = "The reward was changed"
			render json: reward
		else
			#flash[:error] = "The reward was not changed. Please try again."
			#
		end
	end

	def destroy
		reward = Reward.find_by(id: params[:id])
		if current_user == reward.family
			if reward.destroy
				all_rewards = Reward.all
				render json: all_rewards
			else
			end
		else
		end
	end

	private
	def reward_params
		params.require(:reward).permit :name, :cost, :category
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in."
		end
	end
end
