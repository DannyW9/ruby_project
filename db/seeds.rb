require ('pry-byebug')
require_relative('../models/member.rb')

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

################ SESSIONS #################

################ RESERVATIONS #################


binding.pry

nil
