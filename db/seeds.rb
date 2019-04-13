require ('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/gym_class.rb')

Member.delete_all()

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
  'name' => 'Yoga',
  'description' => ' A restful, calming class including breathing, gentle flowing movements, passive and supported poses. This is a perfect beginning yoga class that is also appropriate for those working with injury, limited mobility, or who prefer a softer, gentler approach to yoga.',
  'instructor' => 'Darth Vader'
  })

class1.save()

################ SESSIONS #################

################ RESERVATIONS #################


binding.pry

nil
