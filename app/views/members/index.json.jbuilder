json.members @members do |member|
  json.role member.role
  json.name member.name
  json.points member.points
  json.color member.color
  json.imgUrl member.img_url
  json.assignedTasks member.tasks_left_to_do do |task|
    json.user task.title
    json.point_value task.point_value
    json.assigned_member task.assigned_member.name
    json.deadline task.deadline
    json.complete? task.complete?
    if task.completed_member
      json.completedMember task.completed_member.name
    end
  end
  json.completedTasks member.completed_tasks do |task|
   json.user task.title
   json.point_value task.point_value
   json.assigned_member task.assigned_member.name
   json.deadline task.deadline
   json.complete? task.complete?
   if task.completed_member
      json.completedMember task.completed_member.name
    end
  end
end

