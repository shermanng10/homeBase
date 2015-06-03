class Member < ActiveRecord::Base

  belongs_to :family
  has_many :events, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :assigned_tasks, foreign_key: :assigned_member_id, class_name: "Task", dependent: :destroy
  has_many :completed_tasks, foreign_key: :completed_member_id, class_name: "Task", dependent: :destroy

  validates :name, :family, :img_url, presence: true
  validates :task_points, numericality: {only_integer: true}

  def tasks_left_to_do
    self.assigned_tasks - self.completed_tasks.where(complete: true)
  end

  def assign_color
    colors = ["#1abc9c",  "#e67e22", "#2980b9", "#f1c40f", "#9b59b6", "#34495e", "#d35400", "#FFB6C1", "#FFCA28", "#69F0AE"]
    count = self.family.members.length + 1
    self.color = colors[count]
  end

  def pending_rewards
    self.rewards.where(status: 'pending')
  end

  def unassigned_tasks
    Task.where(family_id: self.family.id, assigned_member_id: nil)
  end

  def pointcolor
    if self.task_points > 0
      return 'greenpoints'
    else
      return 'redpoints'
    end
  end

end
