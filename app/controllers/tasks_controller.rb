class TasksController < ApplicationController
	# before_action :require_login

	def index
		task = Task.where(family_id: current_user.id)
		grouped = task.all(group: assigned_member_id)
		# respond_to |format|
		# 	# format.json {render json: task}
		# 	format.html {}
	end

	def create
		@task = Task.new(task_params)
		@task.family_id = session[:user_id]
		if @task.save
			render json: @task
		end
	end

	def destroy
		p "hello"
		@task = Task.find_by(id: params[:id])
		if @task.destroy
			all_tasks = Task.all
			render json: all_tasks
		end
	end


	private
	def task_params
		params.require(:task).permit :title, :point_value, :assigned_member_id, :deadline
	end

	def require_login
		if !current_user
			# render json: [{title: "Tanya is catty"}]
		end
	end
end
