@user = User.new(:email => 'admin@admin.com', :password => '12345678', :password_confirmation => '12345678')
@user.save

bottles = [{name:"Cristal"},{name:"Branco"},{name:"Pet"}]

bottles.each do |bottle|
  Bottle.find_or_create_by!(bottle)
end

100.times do
  client = Client.new()
  client.name = Faker::FunnyName.name
  client.street = Faker::Address.street_name
  client.number = Faker::Address.building_number
  Bottle.all.each do |bottle|
    client_bottle = ClientBottle.new(bottle_id: bottle.id, quantity: Random.rand(1..4))
    client.client_bottles << client_bottle
  end
  client.save!
end
