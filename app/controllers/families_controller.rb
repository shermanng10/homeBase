class FamiliesController < ApplicationController

  def index
  	family = Family.find_by(id: current_user.id)
  	members = family.members
  	render json: members
  end

  def create
  	new_family = Family.new(family_params)
  	if new_family.save
  		render json: new_family
  	else
  	end
  end

  def destroy
  	family = Family.find_by(id: current_user.id)
  	if family.destroy
  		flash[:success] = "Your ENTIRE account has been deleted"
  	else
  	end
  end

  private
  def family_params
  	params.require(:family).permit :surname, :email, :password
  end
end
