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

member5 = Member.new({
  'first_name' => 'Joe',
  'last_name' => 'Bloggs',
  'membership_type' => 'Premium'
  })

member5.save()





################ GYM CLASSES ################

class1 = GymClass.new({
  'name' => 'Morning Yoga',
  'instructor' => 'Darth Vader',
  'class_time' => '09:00:00',
  'max_capacity' => '10'
  })

class1.save()

class4 = GymClass.new({
  'name' => 'Weights',
  'instructor' => 'Gregor Clegane',
  'class_time' => '19:00',
  'max_capacity' => '15'
  })

class4.save()

class2 = GymClass.new({
  'name' => 'Bootcamp',
  'instructor' => 'Private Ryan',
  'class_time' => '12:00',
  'max_capacity' => '10'
  })

class2.save()

class3 = GymClass.new({
  'name' => 'Spin Class',
  'instructor' => 'Lance Armstrong',
  'class_time' => '16:00',
  'max_capacity' => '4'
  })

class3.save()

class5 = GymClass.new({
  'name' => 'Evening Yoga',
  'instructor' => 'Darth Vader',
  'class_time' => '20:00:00',
  'max_capacity' => '11'
  })

class5.save()

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

reservation5 = Reservation.new({
  'member_id' => "#{member4.id}",
  'gym_class_id' => "#{class4.id}"
  })

reservation5.save()

reservation6 = Reservation.new({
  'member_id' => "#{member5.id}",
  'gym_class_id' => "#{class5.id}"
  })

reservation6.save()

  ######## FULL CLASS #######

reservation7 = Reservation.new({
  'member_id' => "#{member2.id}",
  'gym_class_id' => "#{class3.id}"
  })

reservation7.save()

reservation8 = Reservation.new({
  'member_id' => "#{member1.id}",
  'gym_class_id' => "#{class3.id}"
  })

reservation8.save()

reservation9 = Reservation.new({
  'member_id' => "#{member5.id}",
  'gym_class_id' => "#{class1.id}"
  })

reservation9.save()

reservation10 = Reservation.new({
  'member_id' => "#{member1.id}",
  'gym_class_id' => "#{class2.id}"
  })

reservation10.save()

reservation11 = Reservation.new({
  'member_id' => "#{member3.id}",
  'gym_class_id' => "#{class2.id}"
  })

reservation11.save()



binding.pry

nil
