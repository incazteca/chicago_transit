# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rail_lines = %w[ brown purple yellow red blue orange green ]
rail_lines.each { |line| Line.find_or_create_by(line_name: line) }

Map.create(name: '2015 CTA Rail Map', author: 'system')
