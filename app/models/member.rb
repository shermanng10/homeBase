class Member < ActiveRecord::Base
	belongs_to :family
	has_many :events, dependent: :destroy
	has_many :rewards, dependent: :destroy
	has_many :assigned_tasks, foreign_key: :assigned_member_id, class_name: "Task", dependent: :destroy
	has_many :completed_tasks, foreign_key: :completed_member_id, class_name: "Task", dependent: :destroy

	validates :role, :name, :family, :img_url, :color, presence: true
	validates :points, numericality: {only_integer: true}

end
