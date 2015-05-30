json.rewards @rewards do |reward|
  json.name reward.name
  json.cost reward.cost
  if reward.member
    json.forMember reward.member.name
  end
end

