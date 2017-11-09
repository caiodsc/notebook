namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do
    puts "Gerando os contatos (Contacts)..."
    100.times do |i|
      Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          kind: Kind.all.sample,
          #rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
          rmk: LeroleroGenerator.sentence([1,2,3].sample)
      )
    end
    puts "Gerando os contatos (Contacts)... [OK]"

    puts "Geranado os endereços (Addresses)..."
    Contact.all.each do |contact|
      Address.create!(
          street: Faker::Address.street_name,
          city: Faker::Address.city,
          state: Faker::Address.state,
          contact: contact
      )
    end
    puts "Geranado os endereços (Addresses)...[OK]"

    puts "Geranado os telefones (Phones)..."
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: contact
        )
      end
    end
    puts "Geranado os telefones (Phones)...[OK]"
  end

end
