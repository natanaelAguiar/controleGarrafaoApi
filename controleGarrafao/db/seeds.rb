bottles = [{name:"Cristal"},{name:"Branco"},{name:"Pet"}]

bottles.each do |bottle|
  Bottle.find_or_create_by!(bottle)
end

100.times do
  client = Client.new()
  client.name = Faker::FunnyName.name
  client.street = Faker::Address.street_name
  client.number = Faker::Address.building_number
  Random.rand(1..5).times do
    client_bottle = ClientBottle.new()
    client_bottle.bottle = Bottle.all.sample
    client_bottle.quantity = Random.rand(1..5)
    client.client_bottles << client_bottle
  end
  client.save!
end
