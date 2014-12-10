# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'System', last_name: 'User', email: 'callen@eastersealsetx.org', password: 'sysuser1234', address: 'Bryan, Texas', phone: '979-776-2872', allowOutsideLogin: 'true', is_admin: 'true')
