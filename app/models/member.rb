class Member < ActiveRecord::Base
	belongs_to :family
	has_many :events, dependent: :destroy
	has_many :rewards, dependent: :destroy
	has_many :assigned_tasks, foreign_key: :assigned_member_id, class_name: "Task", dependent: :destroy
	has_many :completed_tasks, foreign_key: :completed_member_id, class_name: "Task", dependent: :destroy

	validates :role, :name, :family, :img_url, :color, presence: true
	validates :points, numericality: {only_integer: true}

  def tasks_left_to_do
    self.assigned_tasks - self.completed_tasks
  end

  def assign_color
    colors = ["#7E57C2", "#42A5F5", "#26A69A", "#FF9800", "#FFEE58", "#78909C", "#EC407A", "#AB47BC", "#26C6DA", "#8BC34A", "#FFCA28", "#69F0AE"]
    count = self.family.members.length
    self.color = colors[count]
  end

  def pending_rewards
    self.rewards.where(status: 'pending')
  end

end
