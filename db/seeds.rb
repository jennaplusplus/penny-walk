# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

walkers = [
  {name: "Ann"},
  {name: "Bob"},
  {name: "Zoe"},
  {name: "Matthew"}
]

turns = [
  {left_right: true, blocks: 1, trip_id: 1, sequence: 1},
  {left_right: false, blocks: 2, trip_id: 2, sequence: 1},
  {left_right: false, blocks: 2, trip_id: 1, sequence: 2},
  {left_right: true, blocks: 3, trip_id: 2, sequence: 3},
  {left_right: true, blocks: 3, trip_id: 1, sequence: 3},
  {left_right: false, blocks: 1, trip_id: 2, sequence: 2},
  {left_right: false, blocks: 2, trip_id: 1, sequence: 4},
  {left_right: true, blocks: 3, trip_id: 2, sequence: 4},
  {left_right: false, blocks: 2, trip_id: 1, sequence: 5},
  {left_right: true, blocks: 1, trip_id: 2, sequence: 5}
]

trips = [
        {
          start_latitude: 37.3717427,
          start_longitude: -122.019002,
          end_latitude: 37.3843212,
          end_longitude: -122.1022363,
          walker_id: 1
        },
        {
          start_latitude: 37.3717427,
          start_longitude: -122.019002,
          end_latitude: 37.3717420,
          end_longitude: -122.1022370,
          walker_id: 1
        },
        {
          start_latitude: 47.665133,
          start_longitude: -122.354170,
          end_latitude: 47.686811,
          end_longitude: -122.336564,
          walker_id: 2
        },
        {
          start_latitude: 51.5189606,
          start_longitude: -0.2199356,
          end_latitude: 51.4985539,
          end_longitude: -0.1323883,
          walker_id: 3
        }
]

walkers.each do |w|
  Walker.create w
end

turns.each do |turn|
  Turn.create turn
end

trips.each do |trip|
  Trip.create trip
end
