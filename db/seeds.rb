require ('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/gym_class.rb')
require_relative('../models/reservation.rb')

Reservation.delete_all()
Member.delete_all()
GymClass.delete_all()

################# MEMBERS #################

member1 = Member.new({
  "first_name" => "Arnold",
  "last_name" => "Schwarzenegger",
  "membership_type" => "Premium"
  })

member1.save()

member2 = Member.new({
  'first_name' => 'Jax',
  'last_name' => 'Teller',
  'membership_type' => 'Regular'
  })

member2.save()

member3 = Member.new({
  'first_name' => 'Gemma',
  'last_name' => 'Morrow',
  'membership_type' => 'Regular'
  })

member3.save()

member4 = Member.new({
  'first_name' => 'Opie',
  'last_name' => 'Winston',
  'membership_type' => 'Premium'
  })

member4.save()

################ GYM CLASSES ################

class1 = GymClass.new({
  'name' => 'Morning Yoga',
  'description' => ' A restful, calming class including breathing, gentle flowing movements, passive and supported poses. This is a perfect beginning yoga class that is also appropriate for those working with injury, limited mobility, or who prefer a softer, gentler approach to yoga.',
  'instructor' => 'Darth Vader',
  'class_time' => '09:00:00',
  'max_capacity' => '10'
  })

class1.save()

class2 = GymClass.new({
  'name' => 'Bootcamp',
  'description' => 'This circuit training based class is designed to challenge your body and mind in a fun environment, all the while building strength and fitness through a variety of exercise stations.',
  'instructor' => 'Private Ryan',
  'class_time' => '12:00',
  'max_capacity' => '10'
  })

class2.save()

class3 = GymClass.new({
  'name' => 'Spin Class',
  'description' => 'A fun, heart-pumping workout on a beautiful Star Trac spin bike. Ride on the flats, up hills, through rolling hills led by a certified instructor motivated by great music.',
  'instructor' => 'Lance Armstrong',
  'class_time' => '16:00',
  'max_capacity' => '12'
  })

class3.save()

class4 = GymClass.new({
  'name' => 'Evening Yoga',
  'description' => ' A restful, calming class including breathing, gentle flowing movements, passive and supported poses. This is a perfect beginning yoga class that is also appropriate for those working with injury, limited mobility, or who prefer a softer, gentler approach to yoga.',
  'instructor' => 'Darth Vader',
  'class_time' => '19:00',
  'max_capacity' => '15'
  })

  class4.save()

################ RESERVATIONS #################

reservation1 = Reservation.new({
  'member_id' => "#{member1.id}",
  'gym_class_id' => "#{class1.id}"
  })

reservation1.save()

reservation2 = Reservation.new({
  'member_id' => "#{member2.id}",
  'gym_class_id' => "#{class2.id}"
  })

reservation2.save()

reservation3 = Reservation.new({
  'member_id' => "#{member3.id}",
  'gym_class_id' => "#{class3.id}"
  })

reservation3.save()

reservation4 = Reservation.new({
  'member_id' => "#{member4.id}",
  'gym_class_id' => "#{class3.id}"
  })

reservation4.save()



binding.pry

nil
