namespace :dev do
  desc "Carga no ambiente de desenvolvimento"
  task setup: :environment do
    
    %x(rails db:drop db:create db:migrate)
    
    puts "Cadastrando os tipos"
      kinds = %w(Amigo Conhecido Comercial)
      kinds.each do |kind|
        Kind.create!(description: kind)
      end
    puts "Tipos cadastrados com sucesso"
    
    puts "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        bithdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample)
    end
    puts "Contatos cadastrados com sucesso"
    
    puts "Cadastrando os telefones"
    Contact.all.each do |c|
      Random.rand(5).times do |i|
        c.phones.create!(number: Faker::PhoneNumber.cell_phone)
        c.save!
      end
    end    
    puts "Telefones cadastrados com sucesso"
    
    puts "Cadastrando os endereços"
    Contact.all.each do |c|
      Address.create(street: Faker::Address.street_address, city: Faker::Address.city, contact: c)
    end    
    puts "Endereços cadastrados com sucesso"
    
  end

end
