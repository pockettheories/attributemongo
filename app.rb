require 'mongo'
require 'faker'

client = Mongo::Client.new 'mongodb://localhost'
client = client.use 'test'

loop {
  attribs = []
  #attribs.append k: "name", v: Faker::Name.name
  attribs.append k: "address", v: Faker::Address.full_address
  attribs.append k: "platform", v: Faker::ProgrammingLanguage.name
  attribs.append k: "company", v: Faker::Company.name
  attribs.append k: "project", v: Faker::Game.title
  
  attribs.delete(attribs[rand(0..3)])

  my_name = Faker::Name.name
  client[:person].insert_one name: my_name, attribs: attribs
  puts "Inserted record for #{my_name}"

  sleep 2
}

client.close

