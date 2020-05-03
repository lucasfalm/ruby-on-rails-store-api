namespace :dev do

  task setup: :environment do
    p 'Cadastrando os tipos de contato'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each { |c| Kind.create!( description: c) }
    p 'Tipos criados!'
  end
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    p 'Criando contatos...'
    100.times do |contact|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 90.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p 'Contatos criados!'
  end
end
