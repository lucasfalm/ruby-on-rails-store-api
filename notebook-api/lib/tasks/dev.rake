namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    100.times do |contact|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(90.years.ago, 18.years.ago)
      )
    end
  end
end
