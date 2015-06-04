
Family.create!(surname: "Kardashian",
              email: "keeping@upwith.com",
              password: "1234567")

Member.create!(name: "Kourtney",
              family_id: 1,
              task_points: 3,
              color:"#1abc9c",
              img_url: "/assets/girl1.jpg")
Member.create!(name: "Khloe",
              family_id: 1,
              task_points: 600,
              color:"#e67e22",
              img_url: "/assets/girl2.jpg")
Member.create!(name: "Kendall",
              family_id: 1,
              task_points: 120,
              color:"#2980b9"
              img_url: "/assets/girl3.jpg")
Member.create!(name: "Kylie",
              family_id: 1,
              task_points: 20,
              color:"#f1c40f",
              img_url: "/assets/girl4.jpg")



task1 = Task.create!(title: "Empty dishwasher" ,
                    point_value: 20,
                    family_id: 1,
                    assigned_member_id: 1,
                    completed_member_id: 1,
                    )
task2 = Task.create!(title: "Clean Bedroom",
                    point_value: 20,
                    family_id: 1,
                    assigned_member_id: 1,
                    completed_member_id: 1)
task3 = Task.create!(title: "Take out trash" ,
                    point_value: 10,
                    family_id: 1,
                    assigned_member_id: 2,
                    completed_member_id: 2
                    )
task4 = Task.create!(title: "Sweep Kitchen floor",
                    point_value: 35,
                    family_id: 1,
                    assigned_member_id: 3,
                    completed_member_id: 3)

task5 = Task.create!(title: "Vaccuum living room",
                    point_value: 45,
                    family_id: 2,
                    assigned_member_id: 4,
                    completed_member_id:4
                    )

task6 = Task.create!(title: "Walk dog",
                    point_value: 15,
                    family_id: 1)

task7 = Task.create!(title: "Feed fish",
                    point_value: 5,
                    family_id: 1,
                    assigned_member_id: 9)

task8 = Task.create!(title: "Fold laundry",
                    point_value: 30,
                    family_id: 1,
                    assigned_member_id: 10,
                    completed_member_id: 10,
                    )

task9 = Task.create!(title: "Vaccuum pool", point_value: 75, family_id: 1)


task10 = Task.create!(title: "Clean countertops", point_value: 20, family_id:1, assigned_member_id: 3)

reward1 = Reward.create!(name: "Gum",  cost: 20, family_id: 1, member_id: 2)
reward2 = Reward.create!(name: "M&M's",  cost: 40,family_id: 1, member_id: 1,)
reward3 = Reward.create!(name: "Happy Meal", cost: 50, family_id: 1, member_id: 2)
reward4 = Reward.create!(name: "Milkshake", cost: 40, family_id: 1, member_id: 1)
reward5 = Reward.create!(name: "Soda",  cost: 30, family_id: 1, member_id: 4, status: "pending")

reward6 = Reward.create!(name: "Pokemon Cards",  cost: 150, family_id: 1, member_id: 3)
reward7 = Reward.create!(name: "Light-up Shoes",  cost: 400 ,family_id: 1, member_id: 3)
reward8 = Reward.create!(name: "Nintendo 3DS",  cost: 4000, family_id: 1, member_id: 4)
reward9 = Reward.create!(name: "Crayons", cost: 30, family_id: 1, member_id: 3, status:"pending")
reward10 = Reward.create!(name: "Trip to Six Flags", cost: 5000, family_id: 1, member_id:3, status:"pending")
reward11 = Reward.create!(name: "New Hat", cost: 20, family_id: 1, member_id: 4)
reward12 = Reward.create!(name: "Puppy",  cost: 9000, family_id: 1, member_id: 2)



event1 = Event.create!(title: "Visit from Kim & Kanye", start_time: Date.today+2, end_time: Date.today+6, family_id: 1, member_id: 3)
event2 = Event.create!(title: "Violin Recital", start_time: Date.today+4, end_time: Date.today+7, family_id: 1, member_id:4)
event3 = Event.create!(title: "School Play", start_time: Date.today+5, end_time: Date.today+8, family_id: 1, member_id: 1)
event4 = Event.create!(title: "Family Game Night", start_time: Date.today+1, end_time: Date.today+3, family_id: 1, member_id: 2)
