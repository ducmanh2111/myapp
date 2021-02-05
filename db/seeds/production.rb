unless !Floor.first
	# Create 7 floors from 1 to 7
	(1..7).each do |i|
	  Floor.create!(floor_number: i)
	end

	# Create room in floor 1, only room 101

	Floor.first.rooms.new(room_number: 101, area: 28).save

	# Create room in floor 2, from 201 to 205

	second_floor = {
		rooms: [
			{
				number: 1,
				area: 28,
			},
			{
				number: 2,
				area: 25,
			},
			{
				number: 3,
				area: 23,
			},
			{
				number: 4,
				area: 28,
			},
			{
				number: 5,
				area: 28,
			},
		]
	}
	second_floor.rooms.each do |room|
		Floor.find(2).rooms.new(room_number: (200 + room.number), area: room.area).save
	end

	# Create room in floor 3, from 301 to 305
	third_floor = {
		rooms: [
			{
				number: 1,
				area: 28,
			},
			{
				number: 2,
				area: 25,
			},
			{
				number: 3,
				area: 23,
			},
			{
				number: 4,
				area: 28,
			},
			{
				number: 5,
				area: 28,
			},
		]
	}
	third_floor.rooms.each do |room|
		Floor.find(3).rooms.new(room_number: (300 + room.number), area: room.area).save
	end

	# Create room in floor 4, from 401 to 405
	fourth_floor = {
		rooms: [
			{
				number: 1,
				area: 28,
			},
			{
				number: 2,
				area: 25,
			},
			{
				number: 3,
				area: 23,
			},
			{
				number: 4,
				area: 28,
			},
			{
				number: 5,
				area: 28,
			},
		]
	}
	fourth_floor.rooms.each do |room|
		Floor.find(4).rooms.new(room_number: (400 + room.number), area: room.area).save
	end

	# Create room in floor 5, from 501 to 505
	fifth_floor = {
		rooms: [
			{
				number: 1,
				area: 28,
			},
			{
				number: 2,
				area: 25,
			},
			{
				number: 3,
				area: 23,
			},
			{
				number: 4,
				area: 28,
			},
			{
				number: 5,
				area: 28,
			},
		]
	}
	fifth_floor.rooms.each do |room|
		Floor.find(5).rooms.new(room_number: (500 + room.number), area: room.area).save
	end

	# Create room in floor 6, from 601 to 605
	sixth_floor = {
		rooms: [
			{
				number: 1,
				area: 28,
			},
			{
				number: 2,
				area: 25,
			},
			{
				number: 3,
				area: 23,
			},
			{
				number: 4,
				area: 28,
			},
			{
				number: 5,
				area: 28,
			},
		]
	}
	sixth_floor.rooms.each do |room|
		Floor.find(6).rooms.new(room_number: (600 + room.number), area: room.area).save
	end

	# Create room in floor 7, only room 701

	Floor.find(7).rooms.new(room_number: 701, area: 28).save
end
