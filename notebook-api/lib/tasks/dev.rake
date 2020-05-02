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
end
