namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    print 'Criando contatos...'
    100.times do |contact|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 90.years.ago, to: 18.years.ago)
      )
    end
    print 'Contatos criados!'
  end
  task setup: :environment do
    print 'Cadastrando os tipos de contato'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each { |c| Kind.create!( description: c) }
    print 'Contatos criados!'
  end
end
