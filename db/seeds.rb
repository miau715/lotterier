# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.destroy_all
Participants.destroy_all
User.destroy_all

admin = User.create(email: 'miau715@gmail.com', password: 'testtest', password_confirmation: 'testtest')
admin.is_admin = true
admin.save!

normal_user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')

event1 = admin.events.create(name: "我是新活動", description: "嘎哩噗哩啵！")
event2 = normal_user.events.create(name: "活動二號", description: "我是活動二號")

event1.cats.create(name: "OREO")
event1.cats.create(name: "P醬")
event1.cats.create(name: "秒妙")
event2.cats.create(name: "甜不辣")
event2.cats.create(name: "豬血糕")
