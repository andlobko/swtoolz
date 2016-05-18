# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.create({name: 'admin', description: 'Can manage everything.'})
role_user = Role.create({name: 'user', description: 'Read only.'})
role_manager = Role.create({name: 'manager', description: 'Can edit except users.'})
user = User.create({name: 'admin', email: 'foo@bar.com',
                    password: 'admin', password_confirmation: 'admin', role_id: role_admin.id})
