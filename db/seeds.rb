# TODO adding the list of users
users_list= [ ['Larry Pham','larryritchie.ceo@gmail.com','Product Manager', '09/09/1989', 2, 'abcd1234!','abcd1234!'],
              ['Kelly Chan','kellychan@gmail.com','Productive Supporter','30/03/1968', 1, 'abcd1234!','abcd1234!'],
              ['Wei Ming','wei.ming@gmail.com','Software Engineer','11/02/1975', 1, 'abcd1234!','abcd1234!'],
              ['JingWei Teoh','Jingwei.teoh@gmail.com','Software Engineer','25/02/1984', 1, 'abcd1234!','abcd1234!'],
              ['Walter Teoh','walter.teoh@gmail.com','Product Manager','20/04/1957', 2, 'abcd1234!','abcd1234!'],
              ['Kelly Keong','kelly.keong@gmail.com','Software Engineer','30/03/1972', 1, 'abcd1234!','abcd1234!'],
              ['Jing Chan Toeh','jingchan.teoh@gmail.com','Product Manager','20/08/1990', 2, 'abcd1234!','abcd1234!'],
              ['CheDinhSon','chedinhson@gmail.com','Software Engineer','30/03/1972', 1, '123456','123456'],
              ['SonCheDinh','sonchedinh@gmail.com','Software Engineer','30/03/1972', 2, '123456','123456'] ]
users_list.each do |user|
  User.create(name: user[0], email: user[1], profile: user[2], birth_date: user[3], permission: user[4], password: user[5], password_confirmation: user[6])
end

# TODO adding the list skill
skill_list = [
                ["Java"],
                ["C++"],
                ["Ruby on Rail"],
                ["PHP"],
                ["Android"],
                ["WindowPhone"]
              ]
              
skill_list.each do |skill|
  Skill.create(name: skill[0])
end

# TODO adding the list team
team_list = [
  ["Andoid", "Team android"],
  ["PHP", "Team PHP"]
]
team_list.each do |team|
  Team.create(name: team[0], description: team[1] )
end

# TODO adding the list position
position_list = [
  ["Leader", "L"],
  ["Member", "M"]
]
position_list.each do |position|
  Position.create(name: position[0], abbreviation: position[1] )
end

# # TODO adding the list team_position
# team_position_list = [
#   [1,1],
#   [1,2]
# ]

# team_position_list.each do |team_position|
#   Skill.create(team_id: team_position[0], position_id: team_position[1] )
# end