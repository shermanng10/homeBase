class MembersController < ApplicationController
	before_action :require_login

	def index
		members = Member.where(family_id: current_user.id)
		render json: members
	end

	def create
		member = Member.new(member_params)
		member.family_id = current_user.id
		#current_user.family.id
		if member.save
			member.color = member.assign_color
			render json: member
		else
		end
	end

	def destroy
		if current_user == member.family
			member = Member.find_by(id: params[:id])
			if member.destroy
				all_members = Member.all
				render json: all_members
			else
			end
		else
			#can't delete someone not in your family.
		end
	end

	private
	def member_params
		params.require(:member).permit :role, :name, :img_url
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in."
		end
	end

end
