namespace :dev do
  desc "Carga no ambiente de desenvolvimento"
  task setup: :environment do
    
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
    
  end

end
